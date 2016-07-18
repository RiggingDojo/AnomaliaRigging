def setupFoot(footControl, ikJntPos, ikJntRot, ikHandleName, orient, ikjnts, jntornt, *args):
    suffix = ikHandleName.replace('ikh_', '')

    # NOTE:  Add all created nodes to a list.
    footNodes = []
    # Create utility nodes
    conBRoll = cmds.shadingNode("condition", asUtility=True, n='conNode_ballRoll_' + suffix)
    conNBRoll = cmds.shadingNode("condition", asUtility=True, n='conNode_negBallRoll_' + suffix)
    conTRoll = cmds.shadingNode("condition", asUtility=True, n='conNode_toeRoll_' + suffix)
    pmaBRollbreak = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pmaNode_rollBreak_' + suffix)
    pmaBRoll = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pmaNode_ballRoll_' + suffix)
    pmaTRoll = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pmaNode_toeRoll_' + suffix)
    conHRoll = cmds.shadingNode("condition", asUtility=True, n='conNode_heelRoll_' + suffix)
    conLBank = cmds.shadingNode("condition", asUtility=True, n='conNode_bankL_' + suffix)
    conRBank = cmds.shadingNode("condition", asUtility=True, n='conNode_bankR_' + suffix)
    revToeFlap = cmds.shadingNode("reverse", asUtility=True, n='revNode_toeFlap_' + suffix)
    footUtilNodes = (conBRoll, conNBRoll, conTRoll, pmaBRoll, pmaTRoll, conHRoll, conLBank, conRBank, revToeFlap)
    for each in footUtilNodes:
        footNodes.append(each)

    # Set operation on nodes
    cmds.setAttr(pmaTRoll + '.operation', 2)
    cmds.setAttr(conTRoll + '.operation', 2)
    cmds.setAttr(conTRoll + '.colorIfFalseR', 0)
    cmds.setAttr(conTRoll + '.colorIfFalseG', 0)
    cmds.setAttr(conTRoll + '.colorIfFalseB', 0)
    cmds.setAttr(conHRoll + '.operation', 4)
    cmds.setAttr(conHRoll + '.colorIfFalseB', 0)
    cmds.setAttr(conHRoll + '.colorIfFalseR', 0)
    cmds.setAttr(conHRoll + '.colorIfFalseG', 0)
    cmds.setAttr(pmaBRoll+ '.operation', 2)
    cmds.setAttr(conNBRoll + '.operation', 3)
    cmds.setAttr(conBRoll + '.operation', 3)
    cmds.setAttr(conLBank + '.operation', 2)
    cmds.setAttr(conRBank + '.operation', 4)
    cmds.setAttr('%s.colorIfFalseR' % conLBank, 0)
    cmds.setAttr('%s.colorIfFalseR' % conRBank, 0)
    cmds.setAttr(pmaBRollbreak + '.input1D[1]', 45)

    # Make Ik Handles
    ikSolvername = ikHandleName.replace('ikh', 'ikSol_foot_' + suffix)
    ikSol = cmds.ikSolver( st='ikSCsolver', ep=0.0, n=ikSolvername)
    ikBall = cmds.ikHandle(n="ikh_ball_" + suffix, sj=ikjnts[0], ee=ikjnts[1], s="sticky", sol=ikSol)
    footNodes.append(ikBall[0])
    ikToe = cmds.ikHandle(n="ikh_toe_" + suffix, sj=ikjnts[1], ee=ikjnts[2], s="sticky", sol=ikSol)
    footNodes.append([ikToe[0], ikBall[0]])
    # Create the foot groups
    footGrps = ('grp_footPivotL', 'grp_footPivotR', 'grp_heel', 'grp_toe', 'grp_ball', 'grp_flap', 'grp_ankle')

    for grp in footGrps:
        grpName = (grp + '_' + suffix)
        cmds.select(d=True)
        grp = cmds.joint(n=grpName)
        # Position the groups
        if grp == footGrps[0] + '_' + suffix:
            cmds.xform(grp, t=ikJntPos[0])
        if grp == footGrps[1] + '_' + suffix:
            cmds.xform(grp, t=ikJntPos[1])
        if grp == footGrps[2] + '_' + suffix:
            cmds.xform(grp, t=ikJntPos[2])
        if grp == footGrps[3] + '_' + suffix:
            cmds.xform(grp, t=ikJntPos[3])
        if grp == footGrps[4] + '_' + suffix:
            cmds.xform(grp, t=ikJntPos[4])
        if grp == footGrps[5] + '_' + suffix:
            cmds.xform(grp, t=ikJntPos[5])
        if grp == footGrps[6] + '_' + suffix:
            cmds.xform(grp, t=ikJntPos[6])

    for i in range(len(footGrps)):
        cmds.joint( footGrps[i]+ '_' + suffix, e=True, zso=True, oj='xyz' )
        cmds.setAttr(footGrps[i]+ '_' + suffix+'.jointOrientX', jntornt[0])
        cmds.setAttr(footGrps[i]+ '_' + suffix+'.jointOrientY', jntornt[1])
        cmds.setAttr(footGrps[i]+ '_' + suffix+'.jointOrientZ', jntornt[2])

    for i in range(len(footGrps)):
        cmds.setAttr(footGrps[i]+ '_' + suffix+'.visibility', 0)
        footNodes.append(footGrps[i] + '_' + suffix)
        cmds.select(d=True)
        if i == 0:
            cmds.parent(footGrps[i]+ '_' + suffix, footControl[1])
        else:
            cmds.parent(footGrps[i]+ '_' + suffix,footGrps[i-1]+ '_' + suffix)
        if i == 5:
            cmds.parent(footGrps[i]+ '_' + suffix, footGrps[3]+ '_' + suffix)
        if i == 6:
            cmds.parent(footGrps[i]+ '_' + suffix, footGrps[4]+ '_' + suffix)
    cmds.parent(ikBall[0], footGrps[4] + '_' + suffix)
    cmds.parent(ikToe[0], footGrps[5] + '_' + suffix)
    cmds.parent(ikHandleName, footGrps[4] + '_' + suffix)
    cmds.select(d=True)

    # Setup toe ---------------------------------------------------
    footRoll = footControl[1] + '.foot_roll'
    rollBreak = footControl[1] + '.roll_break'
    cmds.connectAttr(footRoll, conTRoll + '.firstTerm')
    cmds.connectAttr(footRoll, conTRoll + '.colorIfTrueR')
    cmds.connectAttr(rollBreak, pmaBRollbreak + '.input1D[0]')
    cmds.connectAttr(pmaBRollbreak + '.output1D', conTRoll + '.secondTerm')
    cmds.connectAttr(pmaBRollbreak+ '.output1D', conTRoll + '.colorIfFalseR')
    cmds.connectAttr(pmaBRollbreak+ '.output1D', pmaTRoll + '.input1D[1]')
    cmds.connectAttr(conTRoll + '.outColorR', pmaTRoll + '.input1D[0]')
    cmds.connectAttr(pmaTRoll + '.output1D', 'grp_toe_' + suffix + orient[1])

    # Setup the Heel -----------------------------------------------------
    cmds.connectAttr(footRoll, conHRoll + '.firstTerm')
    cmds.connectAttr(footRoll, conHRoll + '.colorIfTrueR')
    cmds.connectAttr(conHRoll + '.outColorR', 'grp_heel_' + suffix + orient[1])

    # Setup Ball ----------------------------------------------------------
    cmds.connectAttr(footRoll, conBRoll+'.firstTerm')
    cmds.connectAttr(footRoll, conBRoll+'.colorIfTrueR')
    cmds.connectAttr(pmaBRollbreak + '.output1D', conNBRoll+'.secondTerm')
    cmds.connectAttr(pmaBRollbreak + '.output1D', conNBRoll+'.colorIfTrueR')

    cmds.connectAttr(conNBRoll+'.outColorR', pmaBRoll+'.input1D[0]')
    cmds.connectAttr('grp_toe_' + suffix + '.rx', pmaBRoll+'.input1D[1]')
    cmds.connectAttr(pmaBRoll+'.output1D', 'grp_ball_' + suffix + orient[1])
    cmds.connectAttr(conBRoll+'.outColorR', conNBRoll+'.firstTerm')
    cmds.connectAttr(conBRoll+'.outColorR', conNBRoll+'.colorIfFalseR')

    # Toe Flap
    cmds.connectAttr(footControl[1] + '.toe_flap', footGrps[5]+ '_' + suffix + '.rx')
    cmds.connectAttr(footControl[1] + '.toe_pivot', footGrps[5]+ '_' + suffix + '.rz')
    cmds.connectAttr(footControl[1] + '.toe_roll', footGrps[5]+ '_' + suffix + '.ry')

    # eTwist
    cmds.connectAttr(footControl[1] +'.foot_twist', footGrps[3]+ '_' + suffix + orient[2])

    # Bank
    cmds.connectAttr(footControl[1] +'.foot_bank', '%s.firstTerm' % conLBank)
    cmds.connectAttr(footControl[1] +'.foot_bank', '%s.colorIfTrueR' % conLBank)
    cmds.connectAttr('%s.outColorR' % conLBank, footGrps[0]+ '_' + suffix + orient[0])
    cmds.connectAttr(footControl[1] +'.foot_bank', '%s.firstTerm' % conRBank)
    cmds.connectAttr(footControl[1] +'.foot_bank', '%s.colorIfTrueR' % conRBank)
    cmds.connectAttr('%s.outColorR' % conRBank, footGrps[1]+ '_' + suffix + orient[0])

    return footNodes