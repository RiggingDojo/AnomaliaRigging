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
   
class JointItem(object):

    def __init__(self, name, attrName, handed, fingerIndex, parentName, fingerName, wristJoint, hasChildren=True):
        self.fingerIndex = fingerIndex

        self.attrName = attrName
        self.baseName = name + "_" + handed
        self.finger = fingerName
        self.parent = parentName
        
        self.joint = self.baseName #wristJoint + "_" + self.baseName
        self.control = self.baseName + "_CTRL"
        self.setDrivenKey = self.baseName + "_CTRL_SDK"
        self.controlGroup = self.baseName + "_CTRL_GRP"
        
        self.parentControl = self.parent + "_CTRL"
        self.parentJoint = self.parent
        
        self.hasChildren = hasChildren


    
class HandRigger(object):
    
    def __init__(self):
        self.wristFingersList = {}
        self.wristJoint = ""
        self.thumbJointList = None
        self.wristControl = ""
        self.metacarpalsPresent = False
        self.handed = ""
        
    def errorMessage(self, str):
        errorMsg = "HandRigger Error: " + str
        sys.exit(errorMsg)
    
    

    def getJointChildren(self, root):
        children = cmds.listRelatives(root, type="joint", children=True)
        return children

    def getJointDescendants(self, root):
        descendents = cmds.listRelatives(root, allDescendents=True, type="joint")
        descendents.reverse()
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
        
        
    def determineHanded(self, thumb, wrist): #thumb, wrist
        handed = ""

        objectJoint = pc.ls(thumb, type="joint")[0]
        objWorldMat = objectJoint.attr("worldMatrix").get()
        objTransformationMat = dt.TransformationMatrix(objWorldMat)
        objectTrans = objTransformationMat.getTranslation('world')
        
        
        tarJoint = pc.ls(wrist, type="joint")[0]    
        tarWorldMat = tarJoint.attr("worldMatrix").get()
        targetTransformationMat = dt.TransformationMatrix(tarWorldMat)
        targetTrans = targetTransformationMat.getTranslation('world')
        
        worldVector = dt.Vector(0,0,0)

        targetVector = (objectTrans - targetTrans)
        targetVector.normalize()
        
        targetUp = tarWorldMat[1][:3]
        targetUp.normalize()
        
        # find dot product between target and object
        dotProduct = dt.dot(targetUp, targetVector)
        
                
        if dotProduct > 0:
            handed = "R"
        if dotProduct <= 0:
            handed = "L"
            
        return handed
   
    
    def connectWristAttributeToFinger(self, channelList, attributeSuffix="", minVal=-10, maxVal=10, pos=1, neg=1):
        

        for fingerItem in self.wristFingersList:
            if fingerItem == "thumb":
                continue
            
            fingerList = self.wristFingersList[fingerItem]
            
            for element in fingerList:
                jointItem = fingerList[element]
                
                if attributeSuffix:
                    attributeName = jointItem.baseName + "_" + attributeSuffix
                else:
                    attributeName = jointItem.joint
                    
                driver = self.wristControl + '.' + attributeName
                setDrivenKeyGroup = jointItem.setDrivenKey
                
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
    def addAttributeToWrist(self, fingerItem, attributeName, meta=1, base=1, mid=1, tip=1, end=1, canKey=1, minVal = -10, maxVal = 10):

        fingerList = self.wristFingersList[fingerItem]
        seperator = "-------------"
        sepLongName = fingerItem + "_" + attributeName
        cmds.addAttr(self.wristControl, ln=sepLongName, enumName=seperator, at='enum', h=False, keyable=canKey, min=minVal, max=maxVal)
        cmds.setAttr(self.wristControl + "." + sepLongName, lock=True )
      
        if meta ==1 and "meta" in fingerList:
            attrName = fingerList["meta"].attrName
            longName = str(attrName) + "_" + str(attributeName)
            cmds.addAttr(self.wristControl, ln=longName, at='float', min=minVal, max=maxVal, h=False, keyable=canKey)
            
            
        if base ==1 and "base" in fingerList:
            attrName = fingerList["base"].attrName
            longName = str(attrName) + "_" + str(attributeName)
            cmds.addAttr(self.wristControl, ln=longName, at='float', min=minVal, max=maxVal, h=False, keyable=canKey)
            
            
        if mid == 1:
            midNumber = 1;
            for element in fingerList:
                jointIndexname = "mid_0" + str(midNumber)

                if jointIndexname in fingerList:
                    attrName = fingerList[jointIndexname].attrName
                    longName = str(attrName) + "_" + str(attributeName)
                    cmds.addAttr(self.wristControl, ln=longName, at='float', min=minVal, max=maxVal, h=False, keyable=canKey)
                midNumber = midNumber + 1
            
            
        if tip ==1 and "tip" in fingerList:
            attrName = fingerList["tip"].attrName
            longName = str(attrName) + "_" + str(attributeName)
            cmds.addAttr(self.wristControl, ln=longName, at='float', min=minVal, max=maxVal, h=False, keyable=canKey)       
            
        if tip ==1 and "end" in fingerList:
            attrName = fingerList["end"].attrName
            longName = str(attrName) + "_" + str(attributeName)
            cmds.addAttr(self.wristControl, ln=longName, at='float', min=minVal, max=maxVal, h=False, keyable=canKey)          

            
            
    def addFKControlsToFingers(self):
        for finger in self.wristFingersList:
            fingerList = self.wristFingersList[finger]
            jointControl = ""
            
            # for every joint in each finger
            for index in range(len(fingerList)):
                # joint in finger
                jointItem = self.getJointItemFromIndex(fingerList, index)

                if jointItem is None or index == (len(fingerList) - 1):
                    continue
                                    
                joint = jointItem.joint
                jointControl = jointItem.control
                fkControlGroup = jointItem.controlGroup
                controlSDK = jointItem.setDrivenKey
                parentBaseName = jointItem.parent
                parentControl = ""
                
                if parentBaseName is self.wristControl:
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
    def createHandRig(self, paramWristControl):
        self.wristControl = paramWristControl 

        # edge case handling
        if '_CTRL' not in self.wristControl:
            self.errorMessage("Could not find wrist Control. Please select a wrist control.")
        
        # get connections of control into list
        destConnections = cmds.listConnections(self.wristControl, destination = True, type='constraint')
        destConnections = list(set(destConnections))
        
        if len(destConnections) <= 0:
            self.errorMessage("Problem getting destination connections of selected wrist control. Please choose a control that constrains a wrist hierarchy.") 

        orientConstraints = [orientCon for orientCon in destConnections if "orientConstraint" in orientCon]

        if len(orientConstraints) <= 0:
            self.errorMessage("Problem getting orient constraint of selected wrist control. Please choose a control that constrains a wrist hierarchy.") 
            
        # get wrist joint
        outgoingConnections = maya.mel.eval("listConnections -d on -s off -t joint " + orientConstraints[0])
        outgoingConnections = list(set(outgoingConnections))
        
        if not outgoingConnections:
            self.errorMessage("No Outgoing connections found!")
            
        self.wristJoint = outgoingConnections[0]

        
        # keep track of parents of every joint under wrist joint
        allFingersInWrist = self.getJointChildren(self.wristJoint)
        
        originalThumbJoint = self.getThumbJoint(self.wristJoint)
        self.metacarpalsPresent = self.isMetacarpalsPresent(self.wristJoint, originalThumbJoint)
        
        fingerIndex = 0;
        
        self.handed = self.determineHanded(originalThumbJoint, self.wristJoint)
        
        
        for fingerInWrist in allFingersInWrist:
            # accounts for arbitrary number of fingers
            fingerBase = "finger_" + str(fingerIndex+1).zfill(2)
            fingerJoints = self.getJointDescendants(fingerInWrist)
            
            jointIndex = 0;
            midNumber = 1;
            fingerJointList = {}
             
            parentJoint = self.wristJoint + "_CTRL"
            parentBase = self.wristJoint
            
            fingerJoints.insert(0, fingerInWrist)
            
            isThumb = False
            
            for joint in fingerJoints:
                hasChild = self.getJointChildren(joint)
                hasChildFlag = True if hasChild else False
                if joint == originalThumbJoint:
                    isThumb = True
                    
                jointPos = ""
                if self.metacarpalsPresent:
                    if jointIndex == 0:
                        jointPos = "meta"
                    elif jointIndex == 1:
                        jointPos = "base"
                    elif jointIndex == len(fingerJoints)-2: #second to last joint
                        jointPos = "tip"
                    else:
                        jointPos = "mid_0" + str(midNumber)
                        midNumber = midNumber + 1
                    
                else:
                    if jointIndex == 0:
                        jointPos = "base"
                    elif jointIndex == len(fingerJoints)-2:
                        jointPos = "tip"
                    else:
                        jointPos = "mid_0" + str(midNumber)
                        midNumber = midNumber + 1
                
                
                if not hasChildFlag:
                    jointPos = "end"
                
                attributeName = fingerBase + "_" + jointPos   
                #    jointitem(self, name, attrName, handed, fingerIndex, parentName, fingerName, wristJoint, hasChildren=True):                         
                jointItem = JointItem(self.wristJoint + "_" + fingerBase + "_" + jointPos, attributeName, self.handed, jointIndex, parentBase, fingerBase, self.wristJoint, hasChildFlag)

                fingerJointList[jointPos] = jointItem
                parentJoint = joint
                parentBase = jointItem.baseName
                joint = cmds.rename(joint, jointItem.joint)

                jointIndex = jointIndex + 1
                

                
                ##### add base, mid, tip attributes to wrist control
                if hasChildFlag:
                    cmds.addAttr(self.wristControl, ln=jointItem.attrName, at='float', min=-10, max=10, h=False, keyable=True)
                
                
            # add spread, stretch, and twist attributes for each finger to wrist control
            fingerIndex = fingerIndex + 1 
            if fingerJointList:   
                self.wristFingersList[fingerBase] = fingerJointList
                
            if isThumb:
                self.thumbJointList = fingerJointList
        
        # add spread, stretch, and twist attributes for each finger to wrist control
        
        for fingerItem in self.wristFingersList:
            if fingerItem == "thumb":
                continue
            self.addAttributeToWrist(fingerItem, "SPREAD", meta=1, base=1, mid=0, tip=0)
        
        for fingerItem in self.wristFingersList:
            if fingerItem == "thumb":
                continue
            self.addAttributeToWrist(fingerItem, "STRETCH", meta=1, base=1, mid=1, tip=1)
        
        for fingerItem in self.wristFingersList:
            if fingerItem == "thumb":
                continue
            self.addAttributeToWrist(fingerItem, "TWIST", meta=0, base=1, mid=0, tip=0)
        
        if self.metacarpalsPresent:
            for fingerItem in self.wristFingersList:
                if fingerItem == "thumb":
                    continue
                self.addAttributeToWrist(fingerItem, "CUP", meta=1, base=1, mid=1, tip=1)
        
                
        # do operation on all joints in hierarchy
        for fingerBasename in self.wristFingersList:
            finger = self.wristFingersList[fingerBasename]
            jointIndex = 0
            for fingerPos in finger:
                
                jointItem = self.getJointItemFromIndex(finger, jointIndex)

                if jointItem is None:
                    jointIndex = jointIndex + 1
                    continue
                
                jointParent = jointItem.parentJoint
                jointGrandparent = cmds.listRelatives(jointParent, parent=True)
                
                tempGroup = cmds.group( em=True, name='temp' )
                cmds.parent(jointItem.joint, tempGroup)
                cmds.rotate(0,0,0, jointParent)   
                if jointGrandparent: 
                    cmds.parent(jointParent, tempGroup)
                
                
                #CALL ORIENTATION OF JOINTS
                try:
                    self.orientHandJointTo(jointItem.joint, jointParent, self.handed)
                except:
                    if jointGrandparent:
                        cmds.parent(jointParent, jointGrandparent)
                    cmds.parent(jointItem.joint, jointParent)
                    cmds.delete(tempGroup)
                    self.errorMessage("Could not perform orienting joints operation.")
                
                if jointGrandparent:
                    cmds.parent(jointParent, jointGrandparent)
                    
                cmds.parent(jointItem.joint, jointParent)
                
                if not jointItem.hasChildren:
                    cmds.joint(jointItem.joint, edit=True, orientation=(0,0,0))
                        
                cmds.delete(tempGroup)
                    
                    
                jointIndex = jointIndex + 1
        
                    
        if self.metacarpalsPresent:
            tempGroup = cmds.group( em=True, name='temp' )
            cmds.parent(self.thumbJointList["meta"].joint, tempGroup)
            cmds.parent(self.thumbJointList["base"].joint, tempGroup)
            
            cmds.rotate(60, 0, 0, self.thumbJointList["meta"].joint)
            cmds.makeIdentity(self.thumbJointList["meta"].joint, apply=True)  
            
            cmds.rotate(40, 0, 0, self.thumbJointList["base"].joint)
            cmds.makeIdentity(self.thumbJointList["base"].joint, apply=True)  
                            
            cmds.parent(self.thumbJointList["meta"].joint, self.wristJoint)
            cmds.parent(self.thumbJointList["base"].joint, self.thumbJointList["meta"].joint)
            
            cmds.delete(tempGroup)
                                        
        else:        
            tempGroup = cmds.group( em=True, name='temp' )
            cmds.parent(self.thumbJointList["base"].joint, tempGroup)
            nextIndex = self.thumbJointList["base"].fingerIndex + 1
            
            childJointItem = self.getJointItemFromIndex(self.thumbJointList, nextIndex)             
            cmds.parent(childJointItem.joint, tempGroup)
            
            cmds.rotate(90, 0, 0, self.thumbJointList["base"].joint)
            cmds.makeIdentity(self.thumbJointList["base"].joint, apply=True)  
            
            cmds.rotate(90, 0, 0, childJointItem.joint)
            cmds.makeIdentity(childJointItem.joint, apply=True)  
                        
            cmds.parent(self.thumbJointList["base"].joint, self.wristJoint)
            cmds.parent(childJointItem.joint, self.thumbJointList["base"].joint)

            cmds.delete(tempGroup)
        
        
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

class MyWindow(MayaQWidgetDockableMixin, QtGui.QDialog):
    toolName = 'HandRiggerScript'
    
    def __init__(self, parent = None):
        # Delete any previous instances that is detected. Do this before parenting self to main window!
        self.deleteInstances()

        super(self.__class__, self).__init__(parent = parent)
        
        mayaMainWindowPtr = OpenMayaUI.MQtUtil.mainWindow() 
        self.mayaMainWindow = wrapInstance(long(mayaMainWindowPtr), QtGui.QMainWindow)
        
        self.setObjectName(self.__class__.toolName) # Make this unique enough if using it to clear previous instance!

        # Setup window's properties
        self.setWindowFlags(QtCore.Qt.Window)
        self.setWindowTitle('Hand Rigger Script')
        self.setFixedSize(300, 100)

        # Create a button and stuff it in a layout
        label = QtGui.QLabel("Select two hands (right and left) and run script: ", parent=self)
        label.setAlignment(QtCore.Qt.AlignRight)
        label.setGeometry(0, 15, 280, 20)
        
        self.myButton = QtGui.QPushButton('Run')
        self.mainLayout = QtGui.QVBoxLayout()
        self.mainLayout.addWidget(self.myButton)
        self.setLayout(self.mainLayout)
        self.myButton.clicked.connect(self.buttonPush)

    def buttonPush(self):
        selection = cmds.ls( selection=True )
        if len(selection) != 2:
            cmds.error ("HandRigger: Select only two objects, two hand controls.")
            return
        
        hand = HandRigger()
        hand.createHandRig(selection[0])
        
        hand = HandRigger()
        hand.createHandRig(selection[1])
        
        
        sys.stdout.write('HandRigger: Finished!\n') 
             
    # If it's floating or docked, this will run and delete it self when it closes.
    # You can choose not to delete it here so that you can still re-open it through the right-click menu, but do disable any callbacks/timers that will eat memory
    def dockCloseEventTriggered(self):
        self.deleteInstances()

    # Delete any instances of this class
    def deleteInstances(self):
        mayaMainWindowPtr = OpenMayaUI.MQtUtil.mainWindow() 
        mayaMainWindow = wrapInstance(long(mayaMainWindowPtr), QtGui.QMainWindow) # Important that it's QMainWindow, and not QWidget/QDialog

        # Go through main window's children to find any previous instances
        for obj in mayaMainWindow.children():
            if type( obj ) == maya.app.general.mayaMixin.MayaQDockWidget:
                #if obj.widget().__class__ == self.__class__: # Alternatively we can check with this, but it will fail if we re-evaluate the class
                if obj.widget().objectName() == self.__class__.toolName: # Compare object names
                    # If they share the same name then remove it
                    print 'Deleting instance {0}'.format(obj)
                    mayaMainWindow.removeDockWidget(obj) # This will remove from right-click menu, but won't actually delete it! ( still under mainWindow.children() )
                    # Delete it for good
                    obj.setParent(None)
                    obj.deleteLater()        

    # Show window with docking ability
    def run(self):
        self.show(dockable = True)

myWin = MyWindow()
myWin.run()  


''''
selection = cmds.ls( selection=True )
if len(selection) != 2:
    cmds.error ("HandRigger: Select only two objects, two hand controls.")
    
else:
    hand = HandRigger()
    hand.createHandRig(selection[0])

    hand = HandRigger()
    hand.createHandRig(selection[1])


    sys.stdout.write('HandRigger: Finished!') 

'''