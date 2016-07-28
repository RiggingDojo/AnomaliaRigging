import maya.cmds as cmds
from functools import partial
import maya.mel
from pymel.all import *
import pymel.core as pc
import pymel.core.datatypes as dt
import sys
from collections import OrderedDict

import json
import os
import system.utils as utils
reload(utils)

   
class JointItem(object):

    def __init__(self, jointName, fkCtrlName, ctrlGrpName, sdkName, sdkGroupName, parentJoint, parentControl, fingerName, hasChildren=True):
        
        self.joint = jointName
        self.control = fkCtrlName
        self.controlGroup = ctrlGrpName
        self.sdkName = sdkName
        self.sdkGroupName = sdkGroupName
        #self.fingerIndex = fingerIndex
        self.parentJoint = parentJoint
        self.parentControl = parentControl
        self.finger = fingerName
        self.hasChildren = hasChildren

    
class HandRigger(object):
    
    def __init__(self, uiinfo):
        self.UIElements={}

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
        

    
    def connectWristAttributeToFinger(self, channelList, attributeSuffix="", minVal=-10, maxVal=10, pos=1, neg=1):
        
        for finger in self.wristFingersList:
            #if finger == "thumb":
            #    continue
            
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
                            #cmds.setAttr(setDrivenKeyGroup + "." + attr, 50)
                            cmds.setDrivenKeyframe(setDrivenKeyGroup, at=channel, cd=driver)
                        
                        if neg:
                            cmds.setAttr(driver, minVal)   
                            #cmds.setAttr(setDrivenKeyGroup + "." + attr, -50)
          
                        cmds.setDrivenKeyframe(setDrivenKeyGroup, at=channel, cd=driver)
                        
                        #reset to 0
                        cmds.setAttr(driver, 0)
                    
          
          
    # flags indicate which finger joints should be added for attributeName on wrist control
    def addAttributeToWrist(self, finger, attributeName, meta=1, base=1, mid=1, tip=1, end=1, canKey=1, minVal = -10, maxVal = 10):
        
        # get list of joints under finger
        fingerList = self.wristFingersList[finger]
        # create seperator for finger
        seperator = "-------------"
        sepLongName = finger + "_" + attributeName
        print "ADDING ATTRIBUTE " + sepLongName + " to " + self.wristControl
        cmds.addAttr(self.wristControl, ln=sepLongName, enumName=seperator, at='enum', h=False, keyable=canKey, min=minVal, max=maxVal)
        cmds.setAttr(self.wristControl + "." + sepLongName, lock=True )
      
        if end == 1 and len(fingerList) > 0:
            attrName = fingerList[0].sdkName
            longName = str(attrName) + "_" + str(attributeName)
            if attrName is not "none":
                print "ADDING ATTRIBUTE " + longName + " to " + self.wristControl
                cmds.addAttr(self.wristControl, ln=longName, at='float', min=minVal, max=maxVal, h=False, keyable=canKey)
            
        if tip == 1 and len(fingerList) > 1:
            attrName = fingerList[1].sdkName
            longName = str(attrName) + "_" + str(attributeName)
            if attrName is not "none":
                print "ADDING ATTRIBUTE " + longName + " to " + self.wristControl
                cmds.addAttr(self.wristControl, ln=longName, at='float', min=minVal, max=maxVal, h=False, keyable=canKey)
            
        if mid == 1 and len(fingerList) > 2:
            attrName = fingerList[2].sdkName
            longName = str(attrName) + "_" + str(attributeName)
            if attrName is not "none":
                print "ADDING ATTRIBUTE " + longName + " to " + self.wristControl
                cmds.addAttr(self.wristControl, ln=longName, at='float', min=minVal, max=maxVal, h=False, keyable=canKey)
            
        if base == 1 and len(fingerList) > 3:
            attrName = fingerList[3].sdkName
            longName = str(attrName) + "_" + str(attributeName)
            if attrName is not "none":
                print "ADDING ATTRIBUTE " + longName + " to " + self.wristControl
                cmds.addAttr(self.wristControl, ln=longName, at='float', min=minVal, max=maxVal, h=False, keyable=canKey)       
              
        if meta == 1 and len(fingerList) > 4:
            attrName = fingerList[4].sdkName
            longName = str(attrName) + "_" + str(attributeName)
            if attrName is not "none":
                print "ADDING ATTRIBUTE " + longName + " to " + self.wristControl
                cmds.addAttr(self.wristControl, ln=longName, at='float', min=minVal, max=maxVal, h=False, keyable=canKey)    
           
            
    def addFKControlsToFingers(self):
        
        for finger in self.wristFingersList:
            
            fingerList = self.wristFingersList[finger]
            jointControl = ""
            print "LISTED UNDER: " + finger + ":"
            print fingerList
        
            # for every joint in each finger
            #for index in range(len(fingerList) - 1):
            for index, e in reversed(list(enumerate(fingerList))):
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
                
                if jointControl == "none":
                    continue
                
                if parentJoint is self.wristControl:
                    parentControl = self.wristControl
                else:
                    parentControl = jointItem.parentControl
                
                controlWorldSp = cmds.xform(joint, q=True, translation=True, worldSpace=True)
                controlRot = cmds.xform(joint, q=True, rotation=True, worldSpace=True)
                controlObj = cmds.circle( nr=(1, 0, 0), c=(0, 0, 0), n=(jointControl), r=3.0)
                
                print "jointControl=" + jointControl + " .... fkControlGroup=" + fkControlGroup

                controlGroup = cmds.group(jointControl, n=fkControlGroup)
                sdkGroup = cmds.group(jointControl, n=controlSDK)
                

                cmds.xform(controlGroup, a=True, ro=controlRot, t=controlWorldSp )
                cmds.parentConstraint(controlObj, joint)  
                cmds.parent(controlGroup, parentControl)

                        


  
    def ui(self):
        """ Check to see if the UI exists """
        windowName = "HandRigger"
        if cmds.window(windowName, exists=True):
            cmds.deleteUI(windowName)
        """ Define width and height for buttons and windows"""    
        windowWidth = 125
        windowHeight = 400
        buttonWidth = 120
        buttonHeight = 22

        self.UIElements["window"] = cmds.window(windowName, width=windowWidth, height=windowHeight, title="Hand Rigger", sizeable=True)

        self.UIElements["guiFrameLayout1"] = cmds.columnLayout( adjustableColumn=True )
        self.UIElements["guiFlowLayout1"] = cmds.flowLayout(v=True, width=windowWidth, height=windowHeight, wr=False, bgc=[0.2, 0.2, 0.2], p=self.UIElements["guiFrameLayout1"])
        

        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        cmds.text( label='Thumb:' )
        self.UIElements["selthumb"] = cmds.button(label="select thumb joint", width=buttonWidth, height=buttonHeight, bgc=[0.4, 0.2, 0.2], 
            p=self.UIElements["guiFlowLayout1"], c=partial(self.selBtnCallback, 'selthumb'))

        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        cmds.text( label='Index:' )
        self.UIElements["selindex"] = cmds.button(label="select index joint", width=buttonWidth, height=buttonHeight, bgc=[0.4, 0.2, 0.2], 
            p=self.UIElements["guiFlowLayout1"], c=partial(self.selBtnCallback, 'selindex'))
        
        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        cmds.text( label='Middle:' )
        self.UIElements["selmiddle"] = cmds.button(label="select middle joint", width=buttonWidth, height=buttonHeight, bgc=[0.4, 0.2, 0.2], 
            p=self.UIElements["guiFlowLayout1"], c=partial(self.selBtnCallback, 'selmiddle'))
        
        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        cmds.text( label='Ring:' )
        self.UIElements["selring"] = cmds.button(label="select ring joint", width=buttonWidth, height=buttonHeight, bgc=[0.4, 0.2, 0.2], 
            p=self.UIElements["guiFlowLayout1"], c=partial(self.selBtnCallback, 'selring'))
        
        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        cmds.text( label='Pinky:' )
        self.UIElements["selpinky"] = cmds.button(label="select pinky joint", width=buttonWidth, height=buttonHeight, bgc=[0.4, 0.2, 0.2], 
            p=self.UIElements["guiFlowLayout1"], c=partial(self.selBtnCallback, 'selpinky'))

        cmds.separator(w=110, h=20, hr=True, p=self.UIElements["guiFlowLayout1"])
        cmds.text( label='Wrist Control:' )
        self.UIElements["selcontrol"] = cmds.button(label="select wrist control", width=buttonWidth, height=buttonHeight, bgc=[0.4, 0.2, 0.2], 
            p=self.UIElements["guiFlowLayout1"], c=partial(self.selBtnCallback, 'selcontrol'))
        
        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        cmds.text( label='Wrist Joint:' )
        self.UIElements["selwrist"] = cmds.button(label="select wrist joint", width=buttonWidth, height=buttonHeight, bgc=[0.4, 0.2, 0.2], 
            p=self.UIElements["guiFlowLayout1"], c=partial(self.selBtnCallback, 'selwrist'))

        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        sides = ['L_', 'R_', 'C_']
        self.UIElements["sideMenu"] = cmds.optionMenu('Side', label='side', p=self.UIElements["guiFlowLayout1"]) 
        for s in sides:
            cmds.menuItem(label=s, p=self.UIElements["sideMenu"])  
            
        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        self.UIElements["righand"] = cmds.button(label="Rig The Hand", width=buttonWidth, height=buttonHeight, bgc=[0.2, 0.4, 0.2], p=self.UIElements["guiFlowLayout1"], c=self.createHandRig)

        """ Show the window"""
        cmds.showWindow(windowName)

  
  
    def selBtnCallback(self, joint, *args):
        if cmds.ls(sl=True) == []:
            return
        sel=cmds.ls(sl=True)[0]
        cmds.button(self.UIElements[joint], edit=True, label=sel, bgc=[0.2, 0.4, 0.2])
        

    
        
    ########  create hand rig function   ########
    #def createHandRig(self, wristControl, wristJoint):
    def createHandRig(self, args):
        
        self.wristJoint = cmds.button(self.UIElements["selwrist"], q=True, label=True)
        self.wristControl = cmds.button(self.UIElements["selcontrol"], q=True, label=True)
        
        # keep track of parents of every joint under wrist joint
        indexJoint = cmds.button(self.UIElements["selindex"], q=True, label=True)
        ringJoint = cmds.button(self.UIElements["selring"], q=True, label=True)
        middleJoint = cmds.button(self.UIElements["selmiddle"], q=True, label=True)
        pinkyJoint = cmds.button(self.UIElements["selpinky"], q=True, label=True)
        thumbJoint = cmds.button(self.UIElements["selthumb"], q=True, label=True)
        
        fingerNameList = {
                        "index": indexJoint,
                        "ring": ringJoint,
                        "middle": middleJoint,
                        "pinky": pinkyJoint,
                        "thumb": thumbJoint
                        }
        
        for fingerName in fingerNameList:
            
            jointDes = self.getJointDescendants(fingerNameList[fingerName])
            fingerJoints = [desc for desc in jointDes]
            fingerJoints.append(fingerNameList[fingerName])
            self.wristFingersList[fingerName] = []

            
            jointIndex = len(fingerJoints)-1;
            
            # loop through every joint in every finger
            for joint in fingerJoints:
                    
                if jointIndex == 0:
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
                              #(self, jointName, fkCtrlName, ctrlGrpName, sdkName, sdkGroupName, parentJoint, parentControl, fingerName, hasChildren=True):
                jointItem = JointItem(jointName, fkCtrlName, ctrlGrpName, sdkName, sdkGroupName, parentJoint, parentControl, fingerName, hasChildFlag)

                #set variables for next iteration and rename joint 
                joint = cmds.rename(joint, jointItem.joint)
                
                newList = self.wristFingersList[fingerName]
                newList.append(jointItem)
                self.wristFingersList[fingerName] = newList
                
                ##### add base, mid, tip attributes to wrist control
                #if hasChildFlag:
                #    print "ADDING " + jointItem.sdkName + " TO " + self.wristControl
                #    #cmds.addAttr(self.wristControl, ln=jointItem.sdkName, at='float', min=-10, max=10, h=False, keyable=True)
                
                jointIndex = jointIndex - 1
        
        # add spread, stretch, and twist attributes for each finger to wrist control
        for finger in self.wristFingersList:
            self.addAttributeToWrist(finger, "SPREAD", meta=1, base=1, mid=0, tip=0, end=0)
                
        for finger in self.wristFingersList:
            self.addAttributeToWrist(finger, "TWIST", meta=0, base=1, mid=0, tip=0, end=0)
            
        for finger in self.wristFingersList:
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
        #selection = cmds.ls( selection=True )
        #if len(selection) == 2:
        hand = HandRigger(uiinfo) 
        
            # COMMENTED OUT TO TEST
            #check if first selection is a transform & check if the second selection is a joint
            #if cmds.objectType(selection[0]) == "transform" and cmds.objectType(selection[1]) == "joint":
                #hand.createHandRig(selection[0], selection[1])
        hand.ui()
            #else:
            #     errorMsg = "HandRigger Error: First selection must be wrist control, the second selection must be top parent joint of wrist."
            #    sys.exit(errorMsg)

        sys.stdout.write('HandRigger: Finished!')
        
        
