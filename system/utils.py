import maya.cmds as cmds
import json
import tempfile
import os

def writeJson(fileName, data):
    with open(fileName, 'w') as outfile:
        json.dump(data, outfile, sort_keys = True, indent = 4, ensure_ascii=False)
    file.close(outfile)

def readJson(fileName):
    with open(fileName, 'r') as infile:
        data = (open(infile.name, 'r').read())
    return data

def duplicateJoints(name, source, instance):
    dupjnts = []
    for i in range(len(name)):
        newjnt_name = source[i].replace('s_', instance)

        dj = cmds.duplicate(name[i], n=newjnt_name, ic=False, po=True)

        if i == 0:
            cmds.parent(dj[0], w=True)
        else:
            cmds.parent(dj[0], newjnt_name )
        dupjnts.append(dj[0])

    return dupjnts

def createJoint(name, position, instance):
    # Use a list comprehension to build joints.
    jnt_list = [cmds.joint(n=name[i].replace('s_', instance)) for i in range(len(name))]
    for j in range(len(jnt_list)):
        cmds.xform(jnt_list[j], ws=True, t=position[j])

    cmds.select(d=True)    
    return(jnt_list)

def orientJoints(jnt_list, orient):
    for j in range(len(jnt_list)):
        cmds.setAttr('%s.jointOrientX' % jnt_list[j], orient[j][0][0])
        cmds.setAttr('%s.jointOrientY' % jnt_list[j], orient[j][0][1])
        cmds.setAttr('%s.jointOrientZ' % jnt_list[j], orient[j][0][2])
        cmds.makeIdentity(jnt_list[j], apply=True, rotate=True)  


def createControl(ctrlinfo):
    control_info = []
    for info in ctrlinfo:
        # Create ik control
        # Get ws position of the joint
        pos = info[0]
        # Create circle control object
        ctrl_file = os.environ["AR_DATA"]+ 'controls/' + info[2]
 
         # Import a control object
        cmds.file(ctrl_file, i=True)
        ctrl = info[1]
        ctrlgrp = info[1] + '_GRP'
        if cmds.objExists('grp_control') == True:
            cmds.rename('grp_control', ctrlgrp )
            cmds.rename('control', ctrl)
        
        mgrp = cmds.group(n=info[1] + '_MOCAP', em=True)
        zgrp = cmds.group(n=info[1] + '_ZERO')
        cmds.parent(ctrlgrp, mgrp)
        # Move the group to the joint
        cmds.xform(zgrp, t=pos, ws=True)
        control_info.append([ctrlgrp, ctrl, zgrp, mgrp])

        # Lock Attrs
        for attr in info[3]:
            cmds.setAttr(ctrl+attr, channelBox=False, lock=True)
    return(control_info)


def calculatePVPosition(jnts):
    from maya import cmds, OpenMaya
    if len(jnts) != 3:
        return
    else:
        start = cmds.xform(jnts[0], q=1, ws=1, t=1 )
        mid = cmds.xform(jnts[1], q=1, ws=1, t=1 )
        end = cmds.xform(jnts[2], q=1, ws=1, t=1 )
        startV = OpenMaya.MVector(start[0], start[1], start[2])
        midV = OpenMaya.MVector(mid[0], mid[1], mid[2])
        endV = OpenMaya.MVector(end[0], end[1], end[2])
        startEnd = endV - startV
        startMid = midV - startV
        dotP = startMid * startEnd
        proj = float(dotP) / float(startEnd.length())
        startEndN = startEnd.normal()
        projV = startEndN * proj
        arrowV = startMid - projV
        arrowV *= 0.5
        finalV = arrowV + midV
        return [finalV.x, finalV.y, finalV.z]

def connectThroughBC(parentsA, parentsB, children, instance, switchattr ):
    constraints = []
    for j in range(len(children)):
        switchPrefix = children[j].partition('_')[2]
        bcNodeT = cmds.shadingNode("blendColors", asUtility=True, n=instance + 'bcNodeT_switch_' + switchPrefix)
        cmds.connectAttr(switchattr, bcNodeT  + '.blender')
        bcNodeR = cmds.shadingNode("blendColors", asUtility=True, n=instance + 'bcNodeR_switch_' + switchPrefix)
        cmds.connectAttr(switchattr, bcNodeR  + '.blender')
        bcNodeS = cmds.shadingNode("blendColors", asUtility=True, n=instance + 'bcNodeS_switch_' + switchPrefix)
        cmds.connectAttr(switchattr, bcNodeS  + '.blender')
        constraints.append([bcNodeT, bcNodeR, bcNodeS])
        # Input Parents
        cmds.connectAttr(parentsA[j] + '.translate', bcNodeT + '.color1')        
        cmds.connectAttr(parentsA[j] + '.rotate', bcNodeR + '.color1')       
        cmds.connectAttr(parentsA[j] + '.scale', bcNodeS + '.color1')
        if parentsB != 'None':
            cmds.connectAttr(parentsB[j] + '.translate', bcNodeT + '.color2')
            cmds.connectAttr(parentsB[j] + '.rotate', bcNodeR + '.color2')
            cmds.connectAttr(parentsB[j] + '.scale', bcNodeS + '.color2')
        # Output to Children
        cmds.connectAttr(bcNodeT + '.output', children[j] + '.translate')
        cmds.connectAttr(bcNodeR + '.output', children[j] + '.rotate')
        cmds.connectAttr(bcNodeS + '.output', children[j] + '.scale')
    return constraints

def match_ikfk(*args):
    print "Match"
    initializesj = cmds.scriptJob(runOnce=False, kws=False, e=["SelectionChanged", checkForSwitch])

def checkForSwitch(*args):
    print "Check"
    sel = cmds.ls(sl=True)[0]
    print sel
    print cmds.listAttrs(sel, k=True)
    if ".IK_FK" in cmds.listAttrs(cmds.ls(sl=True)[0], k=True):
        print "Has Switch"

def setupMatchScripts(*args):
    # Look for controls with IK_FK attributes and set scriptJobs on them.
    print "Setup Match"

def createStretchyIk(ikjnt_info, rjnt_info, control, ikHandleName, pvName, instance, twistCompensate, pmas,  pvMA, saxis, settingsControl, *args):
    # Find the stretch axis
    suffix = ikHandleName.replace('ikh_', '')

    rootPos = cmds.xform(ikjnt_info[0], q=True, t=True, ws=True)
    midPos = cmds.xform(ikjnt_info[1], q=True, t=True, ws=True)
    endPos = cmds.xform(ikjnt_info[2], q=True, t=True, ws=True)

    # Create the ik solver
    ikSolverName = ikHandleName.replace('IKH', 'ikSol')
    ikSol = cmds.ikSolver( st='ikRPsolver', ep=0.0, n=ikSolverName )
    ikh = cmds.ikHandle(n=ikHandleName, sj=ikjnt_info[0], ee=ikjnt_info[2], s="sticky", sol=ikSol)
    ikSol = cmds.ikHandle(ikh[0], q=True, sol=True)

    # Stretch ----------------------------------------------------------
    #Start by creating all of the nodes we will need for the stretch.
    conRStretch = cmds.shadingNode("condition", asUtility=True, n='conNode_RStretch_' + suffix)
    conEStretch = cmds.shadingNode("condition", asUtility=True, n='conNode_EStretch_' + suffix)

    mdGMStretch = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdNode_GoffsetStretchM_' + suffix)
    mdGRStretch = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdNode_GoffsetStretchR_' + suffix)
    mdGEStretch = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdNode_GoffsetStretchE_' + suffix)
    mdMStretch = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdNode_MStretch_' + suffix)
    mdRStretch = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdNode_RStretch_' + suffix)
    mdEStretch = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdNode_EStretch_' + suffix)

    btaTglStretch = cmds.shadingNode("blendTwoAttr", asUtility=True, n='btaNode_TglStretch_' + suffix)
    btaRStretch = cmds.shadingNode("blendTwoAttr", asUtility=True, n='btaNode_RStretch_' + suffix)
    btaEStretch = cmds.shadingNode("blendTwoAttr", asUtility=True, n='btaNode_EStretch_' + suffix)

    pmaRStretch = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pmaNode_RStretch_' + suffix)
    pmaEStretch = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pmaNode_EStretch_' + suffix)

    ucMStretch = cmds.shadingNode("unitConversion", asUtility=True, n='ucNode_MStretch_' + suffix)
    ucRStretch = cmds.shadingNode("unitConversion", asUtility=True, n='ucNode_RStretch_' + suffix)
    ucEStretch = cmds.shadingNode("unitConversion", asUtility=True, n='ucNode_EStretch_' + suffix)

    shadingnodelist = [conRStretch, conEStretch, mdMStretch, mdRStretch, mdEStretch, btaTglStretch, btaRStretch,
    btaEStretch, pmaRStretch, pmaEStretch, ucMStretch, ucRStretch, ucEStretch, mdGMStretch, mdGRStretch, mdGEStretch]

    # Set operations for nodes
    cmds.setAttr(mdGMStretch + '.operation', 2)
    cmds.setAttr(mdGRStretch + '.operation', 2)
    cmds.setAttr(mdGEStretch + '.operation', 2)
    cmds.setAttr(mdMStretch + '.operation', 2)
    cmds.setAttr(mdEStretch + '.operation', 1)
    cmds.setAttr(mdRStretch + '.operation', 1)

    cmds.setAttr(conRStretch + '.operation', 2)
    cmds.setAttr(conEStretch + '.operation', 2)

    cmds.setAttr(pmaRStretch + '.operation', 1)
    cmds.setAttr(pmaEStretch + '.operation', 1)

    cmds.select(d=True)

    lctrR = cmds.spaceLocator(n='lctrDis_Root_' + suffix)
    cmds.xform(lctrR[0], ws=True, t=rootPos)
    lctrE = cmds.spaceLocator(n='lctrDis_End_' + suffix)
    cmds.xform(lctrE[0], ws=True, t=endPos)
    lctrM = cmds.spaceLocator(n='lctrDis_Mid_' + suffix)
    cmds.xform(lctrM[0], ws=True, t=midPos)

    lctrlist = [lctrR, lctrE, lctrM]
    for l in lctrlist:
        cmds.setAttr(l[0] + '.visibility', 0)

    # Disdim for total chain length
    cmds.select(lctrR, lctrE)
    cmds.distanceDimension(sp=(rootPos), ep=(endPos))
    cmds.rename('distanceDimensionShape1', 'disDimNode_MStretch_' + suffix + '_Shape')
    cmds.rename('distanceDimension1', 'disDimNode_MStretch_' + suffix)
    shadingnodelist.append('disDimNode_MStretch_' + suffix)

    con = cmds.listConnections('disDimNode_MStretch_' + suffix + '_Shape' + '.endPoint', p=True)[0]
    if con != None:
        cmds.disconnectAttr(con, 'disDimNode_MStretch_' + suffix + '_Shape' + '.endPoint')
    con = cmds.listConnections('disDimNode_MStretch_' + suffix + '_Shape' + '.startPoint', p=True)[0]
    if con != None:
        cmds.disconnectAttr(con, 'disDimNode_MStretch_' + suffix + '_Shape' + '.startPoint')

    cmds.connectAttr(lctrR[0] + 'Shape.worldPosition[0]', 'disDimNode_MStretch_' + suffix + '_Shape' + '.startPoint', f=True)
    cmds.connectAttr(lctrE[0] + 'Shape.worldPosition[0]', 'disDimNode_MStretch_' + suffix + '_Shape' + '.endPoint', f=True)

    # Disdim for first 2 joints
    cmds.select(d=True)
    cmds.distanceDimension(sp=(rootPos), ep=(midPos))
    cmds.rename('distanceDimensionShape1', 'disDimNode_RStretch_' + suffix + '_Shape')
    cmds.rename('distanceDimension1', 'disDimNode_RStretch_' + suffix)
    shadingnodelist.append('disDimNode_RStretch_' + suffix)

    con = cmds.listConnections('disDimNode_RStretch_' + suffix + '_Shape' + '.endPoint', p=True)[0]
    if con != None:
        cmds.disconnectAttr(con, 'disDimNode_RStretch_' + suffix + '_Shape' + '.endPoint')
    con = cmds.listConnections('disDimNode_RStretch_' + suffix + '_Shape' + '.startPoint', p=True)[0]
    if con != None:
        cmds.disconnectAttr(con, 'disDimNode_RStretch_' + suffix + '_Shape' + '.startPoint')

    cmds.connectAttr(lctrR[0] + 'Shape.worldPosition[0]', 'disDimNode_RStretch_' + suffix + '_Shape' + '.startPoint', f=True)
    cmds.connectAttr(lctrM[0] + 'Shape.worldPosition[0]', 'disDimNode_RStretch_' + suffix + '_Shape' + '.endPoint', f=True)

    # Disdim for second set joints
    cmds.select(d=True)
    cmds.distanceDimension(sp=(midPos), ep=(endPos))
    cmds.rename('distanceDimensionShape1', 'disDimNode_EStretch_' + suffix + '_Shape')
    cmds.rename('distanceDimension1', 'disDimNode_EStretch_' + suffix)
    shadingnodelist.append('disDimNode_EStretch_' + suffix)

    con = cmds.listConnections('disDimNode_EStretch_' + suffix + '_Shape' + '.endPoint', p=True)[0]
    if con != None:
        cmds.disconnectAttr(con, 'disDimNode_EStretch_' + suffix + '_Shape' + '.endPoint')
    con = cmds.listConnections('disDimNode_EStretch_' + suffix + '_Shape' + '.startPoint', p=True)[0]
    if con != None:
        cmds.disconnectAttr(con, 'disDimNode_EStretch_' + suffix + '_Shape' + '.startPoint')

    cmds.connectAttr(lctrM[0] + 'Shape.worldPosition[0]', 'disDimNode_EStretch_' + suffix + '_Shape' + '.startPoint', f=True)
    cmds.connectAttr(lctrE[0] + 'Shape.worldPosition[0]', 'disDimNode_EStretch_' + suffix + '_Shape' + '.endPoint', f=True)
    cmds.parent('lctrDis_End_' + suffix, control[1])

    rootLen = cmds.getAttr(ikjnt_info[1] + saxis)
    endLen = cmds.getAttr(ikjnt_info[2] + saxis)
    chainLen = (rootLen + endLen)
    negval = False
    cmds.setAttr(ucMStretch + '.conversionFactor', 1)
    cmds.setAttr(ucRStretch + '.conversionFactor', 1)
    cmds.setAttr(ucEStretch + '.conversionFactor', 1)
    if chainLen < 0:
        negval = True
        #cmds.setAttr(ucMStretch + '.conversionFactor', -1)
        cmds.setAttr(ucRStretch + '.conversionFactor', -1)
        cmds.setAttr(ucEStretch + '.conversionFactor', -1)

    # Make node connections
    cmds.connectAttr('disDimNode_MStretch_' + suffix +'.distance', mdGMStretch + '.input1X')
    cmds.connectAttr(mdGMStretch + '.outputX', btaTglStretch + '.input[0]')

    if cmds.attributeQuery('stretch', node=control[1], exists=True):
        cmds.connectAttr(control[1] + '.stretch', btaTglStretch + '.attributesBlender')
    if cmds.attributeQuery('stretch', node=settingsControl[1], exists=True) == True and cmds.attributeQuery('stretch', node=settingsControl[1], enum=True) == True:
        cmds.connectAttr(settingsControl[1] + '.stretch', btaTglStretch + '.attributesBlender')
    if cmds.attributeQuery('stretch', node=settingsControl[1], exists=True) == True and cmds.attributeQuery('stretch', node=settingsControl[1], enum=True) == False:
        revikfk = cmds.shadingNode("reverse", asUtility=True, n='rev_' + instance + '_stretch')
        cmds.connectAttr(settingsControl[1] + '.stretch', revikfk + '.inputX')
        cmds.connectAttr(revikfk + '.outputX', btaTglStretch + '.attributesBlender')

    cmds.connectAttr(btaTglStretch +'.output', ucMStretch + '.input')
    cmds.connectAttr(ucMStretch + '.output', mdMStretch + '.input1X')
    cmds.connectAttr(ucMStretch + '.output', conRStretch + '.firstTerm')
    cmds.connectAttr(ucMStretch + '.output', conEStretch + '.firstTerm')

    cmds.connectAttr(mdMStretch + '.outputX', mdRStretch + '.input1X')
    cmds.connectAttr(mdMStretch + '.outputX', mdEStretch + '.input1X')
    cmds.connectAttr(mdRStretch + '.outputX', conRStretch + '.colorIfTrueR')
    cmds.connectAttr(mdEStretch + '.outputX', conEStretch + '.colorIfTrueR')

    cmds.connectAttr('disDimNode_RStretch_' + suffix +'.distance', mdGRStretch + '.input1X')
    cmds.connectAttr(mdGRStretch + '.outputX', ucRStretch + '.input')
    cmds.connectAttr(ucRStretch + '.output', btaRStretch + '.input[1]')

    cmds.connectAttr('disDimNode_EStretch_' + suffix +'.distance', mdGEStretch + '.input1X')
    cmds.connectAttr(mdGEStretch + '.outputX', ucEStretch + '.input')
    cmds.connectAttr(ucEStretch + '.output', btaEStretch + '.input[1]')
    cmds.connectAttr(conRStretch +'.outColorR', btaRStretch + '.input[0]')
    cmds.connectAttr(conEStretch +'.outColorR', btaEStretch + '.input[0]')
    cmds.connectAttr(btaRStretch + '.output', pmaRStretch + '.input1D[0]')
    cmds.connectAttr(btaEStretch + '.output', pmaEStretch + '.input1D[0]')

    # Set node attributes for chain length
    cmds.setAttr(btaTglStretch + '.input[1]', 0)

    cmds.setAttr(mdRStretch + '.input2X', rootLen)
    cmds.setAttr(mdEStretch + '.input2X', endLen)

    if negval == True:
        cmds.setAttr(conRStretch + '.secondTerm', chainLen * -1)
        cmds.setAttr(conEStretch + '.secondTerm', chainLen * -1)
        cmds.setAttr(mdMStretch + '.input2X', chainLen * -1)
    else:
        cmds.setAttr(conRStretch + '.secondTerm', chainLen)
        cmds.setAttr(conEStretch + '.secondTerm', chainLen)
        cmds.setAttr(mdMStretch + '.input2X', chainLen)
    cmds.setAttr(conRStretch + '.colorIfFalseR', rootLen)
    cmds.setAttr(conEStretch + '.colorIfFalseR', endLen)

    # Connect to ik jnt tx
    cmds.connectAttr(pmaRStretch + '.output1D', ikjnt_info[1] + saxis)
    cmds.connectAttr(pmaEStretch + '.output1D', ikjnt_info[2] + saxis)

    # Connect control attributes
    if cmds.attributeQuery('pv_lock', node=control[1], exists=True):
        cmds.connectAttr(control[1] + '.pv_lock', btaRStretch + '.attributesBlender')
        cmds.connectAttr(control[1] + '.pv_lock', btaEStretch + '.attributesBlender')
    if cmds.attributeQuery('Pv_Lock', node=control[1], exists=True):
        cmds.connectAttr(settingsControl[1] + '.Pv_Lock', btaRStretch + '.attributesBlender')
        cmds.connectAttr(settingsControl[1] + '.Pv_Lock', btaEStretch + '.attributesBlender')
    if cmds.attributeQuery('Root_Length', node=control[1], exists=True):
        cmds.connectAttr(control[1] + '.Root_Length', pmaRStretch + '.input1D[1]')
        cmds.connectAttr(control[1] + '.End_Length', pmaEStretch + '.input1D[1]')
    if cmds.attributeQuery('Root_Length', node=settingsControl[1], exists=True):
        cmds.connectAttr(settingsControl[1] + '.Root_Length', pmaRStretch + '.input1D[1]')
        cmds.connectAttr(settingsControl[1] + '.End_Length', pmaEStretch + '.input1D[1]')
    else:
        pass

    # Calculate twist offset
    offset = matchTwistAngle(ikHandleName+".twist", ikjnt_info, rjnt_info)

    cmds.setAttr(ikHandleName+".twist", offset)

    cmds.poleVectorConstraint(pvName, ikHandleName, weight=1)
    cmds.parent(lctrM, pvName)

    for item in shadingnodelist:
        try:
            cmds.setAttr(item + '.visibility', 0)
        except: pass
    cmds.setAttr(ikh[0] + '.visibility', 0)
    cmds.setAttr(lctrR[0]+ '.visibility', 0)
    cmds.setAttr(lctrE[0]+ '.visibility', 0)

    return(ikh[0], lctrR[0], shadingnodelist, lctrE[0], ikSol)


def matchTwistAngle(twistAttribute, ikJoints, targetJoints):
    currentVector = []
    targetVector = []

    currentVector = calculateTwistVector(ikJoints[0], ikJoints[1], ikJoints[len(ikJoints)-1])
    targetVector = calculateTwistVector(targetJoints[0], targetJoints[1], targetJoints[len(targetJoints)-1])

    targetVector = normaliseVector(targetVector)
    currentVector = normaliseVector(currentVector)

    offsetAngle = calculateAngleBetweenNormalisedVectors(targetVector, currentVector)

    finalOffset = offsetAngle*-1
    finalOffset = offsetAngle

    return finalOffset

def calculateTwistVector(startJoint, secondJoint, endJoint, *args):
    a = cmds.xform(startJoint, q=True, ws=True, t=True)
    endPos = cmds.xform(endJoint, q=True, ws=True, t=True)

    b = [endPos[0] - a[0], endPos[1] - a[1], endPos[2] -a[2]]
    b = normaliseVector(b)

    p = cmds.xform(secondJoint, q=True, ws=True, t=True)

    p_minus_a = [p[0]-a[0], p[1]-a[1], p[2]-a[2]]
    p_minus_a__dot__b = p_minus_a[0]*b[0] + p_minus_a[1]*b[1] + p_minus_a[2]*b[2]

    p_minus_a__dot__b__multiply_b = [p_minus_a__dot__b * b[0], p_minus_a__dot__b * b[1], p_minus_a__dot__b * b[2]]

    q = [a[0] + p_minus_a__dot__b__multiply_b[0], a[1] + p_minus_a__dot__b__multiply_b[1], a[2] + p_minus_a__dot__b__multiply_b[2]]

    twistVector = [p[0] - q[0], p[1] - q[1], p[2] - q[2]]

    return twistVector

def normaliseVector(vector, *args):
    from math import sqrt
    returnVector = list(vector)

    vectorLength = sqrt( returnVector[0]*returnVector[0] + returnVector[1]*returnVector[1] + returnVector[2]*returnVector[2])

    if vectorLength != 0:
        returnVector[0] /= vectorLength
        returnVector[1] /= vectorLength
        returnVector[2] /= vectorLength
    else:
        returnVector[0] = 1.0
        returnVector[1] = 0.0
        returnVector[2] = 0.0

    return returnVector

def calculateAngleBetweenNormalisedVectors(VectA, VectB, *args):
    from math import acos, degrees

    dotProduct = VectA[0]*VectB[0] + VectA[1]*VectB[1] + VectA[2]*VectB[2]\

    if dotProduct <= -1.0:
        dotProduct = -1.0
    elif dotProduct >= 1.0:
        dotProduct = 1.0

    radians = acos(dotProduct)

    return degrees(radians)

def createRigContainer(instance, partData, *args):

    rigContainerName = (partData+'_'+instance+'RIG')
    rigContainer = cmds.container(n=rigContainerName)
    return rigContainer