import maya.cmds as cmds
from functools import partial

class GR_FootRig:

    def __init__(self):
        self.foot_info={}
        self.UIElements={}

    def ui(self, *args):
        """ Check to see if the UI exists """
        windowName = "FootRigger"
        if cmds.window(windowName, exists=True):
            cmds.deleteUI(windowName)
        """ Define width and height for buttons and windows"""    
        windowWidth = 120
        windowHeight = 300
        buttonWidth = 120
        buttonHeight = 22

        self.UIElements["window"] = cmds.window(windowName, width=windowWidth, height=windowHeight, title="RDojo_UI", sizeable=True)

        self.UIElements["guiFrameLayout1"] = cmds.columnLayout( adjustableColumn=True )
        self.UIElements["guiFlowLayout1"] = cmds.flowLayout(v=True, width=windowWidth, height=windowHeight/2, wr=False, bgc=[0.2, 0.2, 0.2], p=self.UIElements["guiFrameLayout1"])
        
        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        self.UIElements["rigbutton"] = cmds.button(label="MakeFootLocs", width=buttonWidth, height=buttonHeight, bgc=[0.2, 0.4, 0.2], 
            p=self.UIElements["guiFlowLayout1"], c=self.createFootLyt)

        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        self.UIElements["selctrl"] = cmds.button(label="select foot control", width=buttonWidth, height=buttonHeight, bgc=[0.4, 0.2, 0.2], 
            p=self.UIElements["guiFlowLayout1"], c=partial(self.selBtnCallback, 'selctrl'))

        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        self.UIElements["selik"] = cmds.button(label="select foot ikHandle", width=buttonWidth, height=buttonHeight, bgc=[0.4, 0.2, 0.2], 
            p=self.UIElements["guiFlowLayout1"], c=partial(self.selBtnCallback, 'selik'))

        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        sides = ['L_', 'R_', 'C_']
        self.UIElements["sideMenu"] = cmds.optionMenu('Side', label='side', p=self.UIElements["guiFlowLayout1"]) 
        for s in sides:
            cmds.menuItem(label=s, p=self.UIElements["sideMenu"])  

        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        self.UIElements["rigfoot"] = cmds.button(label="Rig The Foot", width=buttonWidth, height=buttonHeight, bgc=[0.2, 0.4, 0.2], 
            p=self.UIElements["guiFlowLayout1"], c=self.setupFoot)

        """ Show the window"""
        cmds.showWindow(windowName)


    def selBtnCallback(self, ctrl, *args):
        if cmds.ls(sl=True) == []:
            return
        sel=cmds.ls(sl=True)[0]
        cmds.button(self.UIElements[ctrl], edit=True, label=sel, bgc=[0.2, 0.4, 0.2])

    def createFootLyt(self, *args):
        if cmds.objExists('lyt_ankle') == True:
            cmds.headsUpMessage('A lyt already exists')
            return
        al = cmds.spaceLocator(n='lyt_ankle', p=[0.0, 2.0, 0.0])
        bl = cmds.spaceLocator(n='lyt_ball', p=[0.0, 0.5, 1.0])
        tl = cmds.spaceLocator(n='lyt_toe', p=[0.0, 0.0, 2.0])
        hl = cmds.spaceLocator(n='lyt_heel', p=[0.0, 0.0, -1.0])
        rbl = cmds.spaceLocator(n='lyt_rbank', p=[-0.5, 0.0, 1.0])
        lbl = cmds.spaceLocator(n='lyt_lbank', p=[0.5, 0.0, 1.0])

        cmds.parent(bl, tl, hl, rbl, lbl, al)

    def setupFoot(self, *args):
        self.foot_info['ankle_lyt'] = 'lyt_ankle'
        self.foot_info['ball_lyt'] = 'lyt_ball'
        self.foot_info['toe_lyt'] = 'lyt_toe'
        self.foot_info['heel_lyt'] = 'lyt_heel'
        self.foot_info['rbank_lyt'] = 'lyt_rbank'
        self.foot_info['lbank_lyt'] = 'lyt_lbank'

        footControl = cmds.button(self.UIElements["selctrl"], q=True, l=True)
        ikHandleName = cmds.button(self.UIElements["selik"], q=True, l=True)
        jntornt = [0.0, 0.0, 0.0]
        orient = ['.ry', '.rx', '.rz']
        side = cmds.optionMenu(self.UIElements["sideMenu"], q=True, v=True) 
        suffix = side + '_foot'

        # Add attributes to the foot control
        ctrlAttrs = ('____', 'foot_roll', 'roll_break', 'foot_twist', 'foot_bank', 'toe_flap', 'toe_roll', 'toe_pivot')
        if len(ctrlAttrs)!= 0:
            cmds.select(footControl)
            for attr in ctrlAttrs:
                try:
                    cmds.addAttr(shortName=attr, longName=attr, defaultValue=0, k=True)
                except: pass

        ikJntPos = []
        
        for key, value in self.foot_info.iteritems():
            ikJntPos.append(cmds.xform(value, q=True, ws=True, t=True))
        print ikJntPos

        ikjnts = [side + 'ankle_IKJ', side + 'ball_IKJ', side + 'toe_IKJ', side + 'heel_IKJ']
        cmds.select(d=True)

        for j in range(len(ikjnts)):
            cmds.joint(n=ikjnts[j], p=ikJntPos[j])

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
        footGrps = ('grp_ankle', 'grp_ball', 'grp_toe', 'grp_flap', 'grp_heel', 'grp_footPivotR', 'grp_footPivotL')

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
                cmds.xform(grp, t=ikJntPos[2])
            if grp == footGrps[4] + '_' + suffix:
                cmds.xform(grp, t=ikJntPos[3])
            if grp == footGrps[5] + '_' + suffix:
                cmds.xform(grp, t=ikJntPos[4])
            if grp == footGrps[6] + '_' + suffix:
                cmds.xform(grp, t=ikJntPos[5])

        for i in range(len(footGrps)):
            if cmds.objExists(footGrps[i]+ '_' + suffix) == True:
                pass
            else:
                cmds.joint(footGrps[i]+ '_' + suffix, e=True, zso=True, oj='xyz' )
                cmds.setAttr(footGrps[i]+ '_' + suffix+'.jointOrientX', jntornt[0])
                cmds.setAttr(footGrps[i]+ '_' + suffix+'.jointOrientY', jntornt[1])
                cmds.setAttr(footGrps[i]+ '_' + suffix+'.jointOrientZ', jntornt[2])

        for i in range(len(footGrps)):
            try:
                cmds.setAttr(footGrps[i]+ '_' + suffix+'.visibility', 0)
            except: pass
            footNodes.append(footGrps[i] + '_' + suffix)
            cmds.select(d=True)
            if i == 0:
                cmds.parent(footGrps[i]+ '_' + suffix, footControl)
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
        footRoll = footControl + '.foot_roll'
        rollBreak = footControl + '.roll_break'
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
        cmds.connectAttr(footControl + '.toe_flap', footGrps[5]+ '_' + suffix + '.rx')
        cmds.connectAttr(footControl + '.toe_pivot', footGrps[5]+ '_' + suffix + '.rz')
        cmds.connectAttr(footControl + '.toe_roll', footGrps[5]+ '_' + suffix + '.ry')

        # eTwist
        cmds.connectAttr(footControl +'.foot_twist', footGrps[3]+ '_' + suffix + orient[2])

        # Bank
        cmds.connectAttr(footControl +'.foot_bank', '%s.firstTerm' % conLBank)
        cmds.connectAttr(footControl +'.foot_bank', '%s.colorIfTrueR' % conLBank)
        cmds.connectAttr('%s.outColorR' % conLBank, footGrps[0]+ '_' + suffix + orient[0])
        cmds.connectAttr(footControl +'.foot_bank', '%s.firstTerm' % conRBank)
        cmds.connectAttr(footControl +'.foot_bank', '%s.colorIfTrueR' % conRBank)
        cmds.connectAttr('%s.outColorR' % conRBank, footGrps[1]+ '_' + suffix + orient[0])

        return footNodes