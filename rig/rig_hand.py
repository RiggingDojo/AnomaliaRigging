import maya.cmds as cmds
import maya.mel
from pymel.all import *
import pymel.core as pc
import pymel.core.datatypes as dt
import sys
from collections import OrderedDict

from shiboken import wrapInstance
from PySide import QtGui, QtCore
from maya import OpenMayaUI as OpenMayaUI
from maya.app.general.mayaMixin import MayaQWidgetDockableMixin
from maya.OpenMayaUI import MQtUtil

import json
import os
import system.utils as utils
reload(utils)

   
class JointItem(object):

    def __init__(self, jointName, fkCtrlName, ctrlGrpName, sdkName, sdkGroupName, fingerIndex, parentJoint, parentControl, fingerName, hasChildren=True):
        self.joint = jointName
        self.control = fkCtrlName
        self.controlGroup = ctrlGrpName
        self.sdkName = sdkName
        self.sdkGroupName = sdkGroupName
        self.fingerIndex = fingerIndex
        self.parentJoint = parentJoint
        self.parentControl = parentControl
        self.finger = fingerName
        self.hasChildren = hasChildren

    
class HandRigger(object):
    
    def __init__(self, uiinfo):
        self.wristFingersList = {}
        self.wristJoint = ""
        self.thumbJointList = None
        self.wristControl = ""
        self.metacarpalsPresent = False
        self.handed = uiinfo[0].replace("_", "")
        
        # Get our joint lists from a json file.
        data_path = os.environ["AR_DATA"] + 'data/rig/hand.json'
        # Use our readJson function
        data = utils.readJson(data_path)
        # Load the json into a dictionary
        self.moduleInfo = json.loads( data )
                
    def errorMessage(self, str):
        errorMsg = "HandRigger Error: " + str
        sys.exit(errorMsg)
    
    

    def getJointChildren(self, root):
        children = cmds.listRelatives(root, type="joint", children=True, path=True)
        return children


    def getJointDescendants(self, root):
        descendents = cmds.listRelatives(root, allDescendents=True, type="joint", path=True)
        #descendents.reverse()

        return descendents
        
        
    def getThumbJoint(self, wristJoint):
        jointCountList = {}
        thumbJoint = ""
        children = self.getJointChildren(wristJoint)
        for finger in children:
            descendants = self.getJointDescendants(finger)
            if not descendants:
                continue

            jointCountList[len(descendants)] = finger
        
        minimumLength = min(jointCountList.keys()) 
        thumbJoint = jointCountList[minimumLength]
        return thumbJoint
        
    
    def getDistanceJointToJoint(self, firstJoint, secondJoint):
        
        fromJoint = pc.ls(firstJoint, type="joint")[0]
        toJoint = pc.ls(secondJoint, type="joint")[0]

        fromWorldMat = fromJoint.attr("worldMatrix").get()
        fromWorldPos = fromWorldMat[3][:3]
        
        toWorldMat = toJoint.attr("worldMatrix").get()
        toWorldPos = toWorldMat[3][:3]
                
        
        firstVector = dt.Vector(fromWorldPos)
        secondVector = dt.Vector(toWorldPos)
        
        return firstVector.distanceTo(secondVector)
        
        
    
    def isMetacarpalsPresent(self, wristJoint, thumbJoint):
        jointCountList = {}
        metacarpals = False
        
        children = self.getJointChildren(wristJoint)
        if not children:
            return metacarpals
            
        if thumbJoint in children:
            children.remove(thumbJoint)
        
        #grab any finger
        for child in children:
                        
            grandChildren = self.getJointChildren(child)
            
            if not grandChildren:
                continue
                
            grandChild = grandChildren[0]
            
            wristToChildDist = self.getDistanceJointToJoint(wristJoint, child)
            childToGrandChildDist = self.getDistanceJointToJoint(child, grandChild)
            
            if childToGrandChildDist > wristToChildDist:
                metacarpals = True
                
        return metacarpals
        
    
    def connectWristAttributeToFinger(self, channelList, attributeSuffix="", minVal=-10, maxVal=10, pos=1, neg=1):
        
        for finger in self.wristFingersList:
            if finger == "thumb":
                continue
            
            fingerList = self.wristFingersList[finger]
            
            for index in range(len(fingerList)-1):
                jointItem = fingerList[index]
                
                if attributeSuffix:
                    attributeName = jointItem.sdkName + "_" + attributeSuffix
                else:
                    attributeName = jointItem.sdkName
                    
                driver = self.wristControl + '.' + attributeName
                setDrivenKeyGroup = jointItem.sdkGroupName
                
                for channel in channelList:
                    attr = (channel[0] + channel[-1]).lower()
                    attrExists = cmds.attributeQuery(attributeName, node= self.wristControl, ex=True )
                    if attrExists:
                        cmds.setAttr(driver, 0)
                        cmds.setAttr(setDrivenKeyGroup + "." + attr, 0)
                        cmds.setDrivenKeyframe(setDrivenKeyGroup, at=channel, cd=driver)
                        
                        if pos:
                            cmds.setAttr(driver, maxVal)
                            cmds.setAttr(setDrivenKeyGroup + "." + attr, 50)
                            cmds.setDrivenKeyframe(setDrivenKeyGroup, at=channel, cd=driver)
                        
                        if neg:
                            cmds.setAttr(driver, minVal)   
                            cmds.setAttr(setDrivenKeyGroup + "." + attr, -50)
          
                        cmds.setDrivenKeyframe(setDrivenKeyGroup, at=channel, cd=driver)
                        
                        #reset to 0
                        cmds.setAttr(driver, 0)
                    
          
          
    # flags indicate which finger joints should be added for attributeName on wrist control
    def addAttributeToWrist(self, finger, attributeName, meta=1, base=1, mid=1, tip=1, end=1, canKey=1, minVal = -10, maxVal = 10):
                
        fingerList = self.wristFingersList[finger]
        seperator = "-------------"
        sepLongName = finger + "_" + attributeName
        cmds.addAttr(self.wristControl, ln=sepLongName, enumName=seperator, at='enum', h=False, keyable=canKey, min=minVal, max=maxVal)
        cmds.setAttr(self.wristControl + "." + sepLongName, lock=True )
      
        if meta == 1 and len(fingerList) > 0:
            attrName = fingerList[0].sdkName
            longName = str(attrName) + "_" + str(attributeName)
            cmds.addAttr(self.wristControl, ln=longName, at='float', min=minVal, max=maxVal, h=False, keyable=canKey)
            
        if base == 1 and len(fingerList) > 1:
            attrName = fingerList[1].sdkName
            longName = str(attrName) + "_" + str(attributeName)
            cmds.addAttr(self.wristControl, ln=longName, at='float', min=minVal, max=maxVal, h=False, keyable=canKey)
            
        if mid == 1 and len(fingerList) > 2:
            attrName = fingerList[2].sdkName
            longName = str(attrName) + "_" + str(attributeName)
            cmds.addAttr(self.wristControl, ln=longName, at='float', min=minVal, max=maxVal, h=False, keyable=canKey)
            
        if tip == 1 and len(fingerList) > 3:
            attrName = fingerList[3].sdkName
            longName = str(attrName) + "_" + str(attributeName)
            cmds.addAttr(self.wristControl, ln=longName, at='float', min=minVal, max=maxVal, h=False, keyable=canKey)       
              
        if end == 1 and len(fingerList) > 4:
            attrName = fingerList[4].sdkName
            longName = str(attrName) + "_" + str(attributeName)
            cmds.addAttr(self.wristControl, ln=longName, at='float', min=minVal, max=maxVal, h=False, keyable=canKey)    
           
            
    def addFKControlsToFingers(self):
        for finger in self.wristFingersList:
            
            fingerList = self.wristFingersList[finger]
            jointControl = ""
            
            # for every joint in each finger
            for index in range(len(fingerList) - 1):
                # joint in finger
                jointItem = fingerList[index]
                
                # check if the last joint in the finger
                if jointItem is None:# or index == (len(fingerList) - 1):
                    continue
                                    
                joint = jointItem.joint
                jointControl = jointItem.control
                fkControlGroup = jointItem.controlGroup
                controlSDK = jointItem.sdkGroupName
                parentJoint = jointItem.parentJoint
                parentControl = ""
                
                if parentJoint is self.wristControl:
                    parentControl = self.wristControl
                else:
                    parentControl = jointItem.parentControl
                
                controlWorldSp = cmds.xform(joint, q=True, translation=True, worldSpace=True)
                controlRot = cmds.xform(joint, q=True, rotation=True, worldSpace=True)
                controlObj = cmds.circle( nr=(1, 0, 0), c=(0, 0, 0), n=(jointControl), r=3.0)
                
                controlGroup = cmds.group(jointControl, n=fkControlGroup)
                sdkGroup = cmds.group(jointControl, n=controlSDK)
                

                cmds.xform(controlGroup, a=True, ro=controlRot, t=controlWorldSp )
                cmds.parentConstraint(controlObj, joint) 
                                 
                cmds.parent(controlGroup, parentControl)

                        

       
    # function that uses world matrices of objects to orient joints down the chain
    def orientHandJointTo(self, target, object, handed):
        objectJoint = pc.ls(object, type="joint")[0]
        objWorldMat = objectJoint.attr("worldMatrix").get()
        objWorldPos = objWorldMat[3][:3]
        
        
        tarJoint = pc.ls(target, type="joint")[0]    
        tarWorldMat = tarJoint.attr("worldMatrix").get()
        tarWorldPos = tarWorldMat[3][:3]
        
        wristJoint = pc.ls(self.wristJoint, type="joint")[0]
        wristWorldMat = wristJoint.attr("worldMatrix").get()
        wristWorldPos = wristWorldMat[3][:3]    
            
        # get aim vector from object to target
        if handed == "L":
            aimVector = tarWorldPos - objWorldPos
        if handed == "R":
            aimVector = objWorldPos - tarWorldPos

        aimVector = dt.Vector(aimVector)
        aimVector.normalize()
        aimX = aimVector
        
        # get z axis used to rotate object around its z
        objUpVector = dt.Vector(objWorldMat[2][:3])
        
        # find dot product of objUpVector and aimX to help get up vector of aimX
        dotProduct = dt.dot(objUpVector, aimX)
        
        # construct rotation matrix
        aimRotationMat = dt.Matrix(3)
        aimRotationMat[0] = aimX
        aimRotationMat[1] = dt.Vector(wristWorldMat[1][:3])
        aimRotationMat[2] = dt.Vector(wristWorldMat[2][:3])
        
        # convert rotation matrix to Euler angles
        aimRotationTransMat = dt.TransformationMatrix(aimRotationMat)
        aimRotationQuaternion = aimRotationTransMat.getRotationQuaternion()
        
        # set object rotation to final aim rotation vector
        objectJoint.setOrientation(aimRotationQuaternion)



    
    def getJointItemFromIndex(self, fingerList, findIndex):
        # get finger position of the index
        fingerIndex = 0
        for fingerPos in fingerList:
            fingerIndex = fingerList[fingerPos].fingerIndex
            if findIndex == fingerIndex:
                break
                
        if self.metacarpalsPresent:
            if fingerIndex == 0:
                if 'meta' in fingerList:
                    return fingerList['meta']
            elif fingerIndex == 1:
                if 'base' in fingerList:
                    return fingerList['base'] 
            elif fingerIndex ==  (len(fingerList)-2):
                if 'tip' in fingerList:
                    return fingerList['tip']
            elif fingerIndex ==  (len(fingerList)-1):
                if 'end' in fingerList:
                    return fingerList['end']
            else:
                return fingerList[fingerPos]            
                    
                                
        if not self.metacarpalsPresent:
            if fingerIndex == 0:
                if 'base' in fingerList:
                    return fingerList['base'] 
            elif fingerIndex ==  (len(fingerList)-2):
                if 'tip' in fingerList:
                    return fingerList['tip']
            elif fingerIndex ==  (len(fingerList)-1):
                if 'end' in fingerList:
                    return fingerList['end']
            else:
                return fingerList[fingerPos]            
  
        
    ########  create hand rig function   ########
    def createHandRig(self, wristControl, wristJoint):
    
        self.wristJoint = wristJoint
        if wristControl:
            self.wristControl = wristControl
        else:
            print "Creating wrist control"

        # keep track of parents of every joint under wrist joint
        allFingersInWrist = self.getJointChildren(self.wristJoint)
        originalThumbJoint = self.getThumbJoint(self.wristJoint)
        self.metacarpalsPresent = self.isMetacarpalsPresent(self.wristJoint, originalThumbJoint)

        fingerIndex = 0;
        
                
        for fingerInWrist in allFingersInWrist:
            # accounts for arbitrary number of fingers
            fingerJoints = self.getJointDescendants(fingerInWrist)
            
            fingerJoints.append(fingerInWrist)

            jointIndex = len(fingerJoints)-1;
            fingerList = []
            fingerName = ""

            for joint in fingerJoints:
                
                if jointIndex == len(fingerJoints)-1:
                    longName = fingerJoints[-1]
                    
                    fingerName = longName.split('|')[-1]
                                        
                    seperator = "-------------"
                    cmds.addAttr(self.wristControl, ln=fingerName, enumName=seperator, at='enum', h=False, keyable=True)
                    cmds.setAttr(self.wristControl + "." + fingerName, lock=True )
                    
                    
                    parentJoint = fingerJoints[:2]
                    parentControl = self.moduleInfo[fingerName][jointIndex]["FK_CTRL"].replace('s_', self.handed + "_")
                
                elif jointIndex == 0:
                    parentJoint = self.wristJoint
                    parentControl = self.wristControl
                
                else:
                    parentIndex = jointIndex - 1
                    parentJoint = fingerJoints[parentIndex]
                    parentControl = self.moduleInfo[fingerName][parentIndex]["FK_CTRL"].replace('s_', self.handed + "_")
                    
                    
                hasChild = self.getJointChildren(joint)
                hasChildFlag = True if hasChild else False
                                   
                jointName = self.moduleInfo[fingerName][jointIndex]["JOINT"].replace('s_', self.handed + "_")
                fkCtrlName = self.moduleInfo[fingerName][jointIndex]["FK_CTRL"].replace('s_', self.handed + "_")
                ctrlGrpName = self.moduleInfo[fingerName][jointIndex]["CTRL_GRP"].replace('s_', self.handed + "_")
                sdkGroupName = self.moduleInfo[fingerName][jointIndex]["SDK"].replace('s_', self.handed + "_")
                sdkName = self.moduleInfo[fingerName][jointIndex]["SDK_NAME"].replace('s_', self.handed + "_")
                                       
                                      
                #create the JointItem:
                              #(self, jointName, fkCtrlName, ctrlGrpName, sdkName, sdkGroupName, fingerIndex, parentJoint, parentControl, fingerName, hasChildren=True):
                jointItem = JointItem(jointName, fkCtrlName, ctrlGrpName, sdkName, sdkGroupName, fingerIndex, parentJoint, parentControl, fingerName, hasChildFlag)
                
                #fingerList.append(jointItem)
                fingerList.insert(0, jointItem)
                
                #set variables for next iteration and rename joint 
                joint = cmds.rename(joint, jointItem.joint)
                
                ##### add base, mid, tip attributes to wrist control
                if hasChildFlag:
                    cmds.addAttr(self.wristControl, ln=jointItem.sdkName, at='float', min=-10, max=10, h=False, keyable=True)
                
                jointIndex = jointIndex - 1
                
            self.wristFingersList[fingerName] = fingerList

            fingerIndex = fingerIndex + 1 
        
        # add spread, stretch, and twist attributes for each finger to wrist control
        
        for finger in self.wristFingersList:
            if finger == "thumb":
                continue
            self.addAttributeToWrist(finger, "SPREAD", meta=1, base=1, mid=0, tip=0, end=0)
                
        for finger in self.wristFingersList:
            if finger == "thumb":
                continue
            self.addAttributeToWrist(finger, "TWIST", meta=0, base=1, mid=0, tip=0, end=0)
            
        for finger in self.wristFingersList:
            if finger == "thumb":
                continue
            self.addAttributeToWrist(finger, "CUP", meta=1, base=1, mid=1, tip=1, end=0)
        # add FK controls to fingers and connect the set driven keys so the SDK group
        self.addFKControlsToFingers()
        
        # connect attribute to FK controls with set driven key
        channelList = ["rotateZ"]
        self.connectWristAttributeToFinger(channelList)
        
        channelList = ["rotateY"]
        self.connectWristAttributeToFinger(channelList,"SPREAD")
        
        channelList = ["translateX"]
        self.connectWristAttributeToFinger(channelList,"STRETCH", neg=0)
        
        channelList = ["rotateX"]
        self.connectWristAttributeToFinger(channelList,"TWIST")
        
        if self.metacarpalsPresent:
            channelList = ["rotateZ"]
            self.connectWristAttributeToFinger(channelList,"CUP")


# We can use variables above the class level that can be read on class import
# This is also known as an attribute of a class
classname = 'Rig_Hand'
lytfile = 'hand.json'
numjnts = 1

class Rig_Hand:
    def __init__(self, uiinfo):
        # run the hand rigging script from selection(s)
        selection = cmds.ls( selection=True )
        if len(selection) == 2:
            hand = HandRigger(uiinfo) 
        
            # COMMENTED OUT TO TEST
            #check if first selection is a transform & check if the second selection is a joint
            if cmds.objectType(selection[0]) == "transform" and cmds.objectType(selection[1]) == "joint":
                hand.createHandRig(selection[0], selection[1])
            else:
                errorMsg = "HandRigger Error: First selection must be wrist control, the second selection must be top parent joint of wrist."
                sys.exit(errorMsg)

        sys.stdout.write('HandRigger: Finished!')
        

