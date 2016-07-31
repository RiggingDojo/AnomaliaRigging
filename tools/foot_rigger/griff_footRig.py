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
        windowHeight = 320
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
        self.UIElements["selankle"] = cmds.button(label="select foot ankle_IKJ", width=buttonWidth, height=buttonHeight, bgc=[0.4, 0.2, 0.2], 
            p=self.UIElements["guiFlowLayout1"], c=partial(self.selBtnCallback, 'selankle'))

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
        al = cmds.spaceLocator(n='lyt_ankle')
        cmds.xform(al, ws=True, t=[0.0, 2.0, 0.0])
        bl = cmds.spaceLocator(n='lyt_ball')
        cmds.xform(bl, ws=True, t=[0.0, 0.5, 1.0])
        tl = cmds.spaceLocator(n='lyt_toe')
        cmds.xform(tl, ws=True, t=[0.0, 0.0, 2.0])
        hl = cmds.spaceLocator(n='lyt_heel')
        cmds.xform(hl, ws=True, t=[0.0, 0.0, -1.0])
        rbl = cmds.spaceLocator(n='lyt_rbank')
        cmds.xform(rbl, ws=True, t=[-0.5, 0.0, 1.0])
        lbl = cmds.spaceLocator(n='lyt_lbank')
        cmds.xform(lbl, ws=True, t=[0.5, 0.0, 1.0])

        cmds.parent(bl, tl, hl, rbl, lbl, al)

    def setupFoot(self, *args):
        footControl = cmds.button(self.UIElements["selctrl"], q=True, l=True)
        ikHandleName = cmds.button(self.UIElements["selik"], q=True, l=True)
        ikAnkleJnt = cmds.button(self.UIElements["selankle"], q=True, l=True)
        jntornt = [0.0, 0.0, 0.0]
        orient = ['.rx', '.ry', '.rz']
        side = cmds.optionMenu(self.UIElements["sideMenu"], q=True, v=True) 
        suffix = side + '_foot_'

        #'grp_footPivotL', 'grp_footPivotR', 'grp_heel', 'grp_toe', 'grp_ball', 'grp_flap', 'grp_ankle'
        self.foot_info['lbank_lyt'] = [suffix + 'lyt_lbank', cmds.xform('lyt_lbank', q=True, ws=True, t=True)]
        self.foot_info['rbank_lyt'] = [suffix + 'lyt_rbank', cmds.xform('lyt_rbank', q=True, ws=True, t=True)]
        self.foot_info['heel_lyt'] = [suffix + 'lyt_heel', cmds.xform('lyt_heel', q=True, ws=True, t=True)]
        self.foot_info['toe_lyt'] = [suffix + 'lyt_toe', cmds.xform('lyt_toe', q=True, ws=True, t=True)]
        self.foot_info['ball_lyt'] = [suffix + 'lyt_ball', cmds.xform('lyt_ball', q=True, ws=True, t=True)]
        self.foot_info['ankle_lyt'] = [suffix + 'lyt_ankle', cmds.xform('lyt_ankle', q=True, ws=True, t=True)]
        self.foot_info['flap_lyt'] = [suffix + 'lyt_flap', cmds.xform('lyt_toe', q=True, ws=True, t=True)]

        # Add attributes to the foot control
        ctrlAttrs = ('____', 'foot_roll', 'roll_break', 'foot_twist', 'foot_bank', 'toe_flap', 'toe_roll', 'toe_pivot')
        if len(ctrlAttrs)!= 0:
            cmds.select(footControl)
            for attr in ctrlAttrs:
                try:
                    cmds.addAttr(shortName=attr, longName=attr, defaultValue=0, k=True)
                except: pass
        
        ikjnts = [side + 'ball_IKJNT',  side + 'toe_IKJNT', side + 'heel_IKJNT']
        cmds.select(d=True)

        #cmds.joint(n=ikjnts[0], p=self.foot_info['ankle_lyt'][1])
        cmds.joint(n=ikjnts[0], p=self.foot_info['ball_lyt'][1])
        cmds.joint(n=ikjnts[1], p=self.foot_info['toe_lyt'][1])
        cmds.joint(n=ikjnts[2], p=self.foot_info['heel_lyt'][1])  
        cmds.parent(ikjnts[0], ikAnkleJnt )   
        cmds.select(d=True)

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
        ikSolvername = ikHandleName.replace('ikh', suffix + 'ikSol_foot')
        ikSol = cmds.ikSolver( st='ikSCsolver', ep=0.0, n=ikSolvername)
        ikBall = cmds.ikHandle(n=suffix + "ikh_ball" , sj=ikAnkleJnt , ee=ikjnts[0], s="sticky", sol=ikSol)
        footNodes.append(ikBall[0])
        ikToe = cmds.ikHandle(n=suffix + "ikh_toe", sj=ikjnts[0], ee=ikjnts[1], s="sticky", sol=ikSol)
        footNodes.append([ikToe[0], ikBall[0]])
        
        # Create the foot groups
        footGrps = []
        for key in self.foot_info:
            cmds.select(d=True)
            grp = cmds.joint(n=self.foot_info[key][0].replace('lyt', 'grp'))
            cmds.xform(grp, t=self.foot_info[key][1])
            footGrps.append(grp)     

        for i in range(len(footGrps)):
            if cmds.objExists(footGrps[i]+ '_' + suffix) == True:
                pass
            else:
                cmds.joint(footGrps[i], e=True, zso=True, oj='xyz' )
                cmds.setAttr(footGrps[i]+'.jointOrientX', jntornt[0])
                cmds.setAttr(footGrps[i]+'.jointOrientY', jntornt[1])
                cmds.setAttr(footGrps[i]+'.jointOrientZ', jntornt[2])

        for i in range(len(footGrps)):
            try:
                cmds.setAttr(footGrps[i]+ '_' + suffix+'.visibility', 0)
            except: pass
            footNodes.append(footGrps[i] + '_' + suffix)
            cmds.select(d=True)
        #[u'0 L__foot_grp_rbank', u'1 L__foot_grp_toe', u'2 L__foot_grp_flap', u'3 L__foot_grp_heel', 
        # u'4 L__foot_grp_ball', u'5 L__foot_grp_ankle', u'6 L__foot_grp_lbank']

        cmds.parent(footGrps[0], footGrps[6])
        cmds.parent(footGrps[3], footGrps[0])
        cmds.parent(footGrps[1], footGrps[3])
        cmds.parent(footGrps[4], footGrps[1])
        cmds.parent(footGrps[2], footGrps[1])
        cmds.parent(footGrps[5], footGrps[4])
        cmds.parent(ikBall, footGrps[4])
        cmds.parent(ikToe, footGrps[2])
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
        cmds.connectAttr(pmaTRoll + '.output1D', suffix + 'grp_toe' + orient[0])

        # Setup the Heel -----------------------------------------------------
        cmds.connectAttr(footRoll, conHRoll + '.firstTerm')
        cmds.connectAttr(footRoll, conHRoll + '.colorIfTrueR')
        cmds.connectAttr(conHRoll + '.outColorR', suffix + 'grp_heel' + orient[0])

        # Setup Ball ----------------------------------------------------------
        cmds.connectAttr(footRoll, conBRoll+'.firstTerm')
        cmds.connectAttr(footRoll, conBRoll+'.colorIfTrueR')
        cmds.connectAttr(pmaBRollbreak + '.output1D', conNBRoll+'.secondTerm')
        cmds.connectAttr(pmaBRollbreak + '.output1D', conNBRoll+'.colorIfTrueR')

        cmds.connectAttr(conNBRoll+'.outColorR', pmaBRoll+'.input1D[0]')
        cmds.connectAttr(suffix + 'grp_toe' + '.rx', pmaBRoll+'.input1D[1]')
        cmds.connectAttr(pmaBRoll+'.output1D', suffix + 'grp_ball' + orient[0])
        cmds.connectAttr(conBRoll+'.outColorR', conNBRoll+'.firstTerm')
        cmds.connectAttr(conBRoll+'.outColorR', conNBRoll+'.colorIfFalseR')

        # Toe Flap
        cmds.connectAttr(footControl + '.toe_flap', suffix + 'grp_flap' + '.rx')
        cmds.connectAttr(footControl + '.toe_pivot', suffix + 'grp_flap' + '.ry')
        cmds.connectAttr(footControl + '.toe_roll', suffix + 'grp_flap' + '.rz')

        # eTwist
        cmds.connectAttr(footControl +'.foot_twist', suffix + 'grp_ball' + orient[1])

        # Bank
        cmds.connectAttr(footControl +'.foot_bank', '%s.firstTerm' % conLBank)
        cmds.connectAttr(footControl +'.foot_bank', '%s.colorIfTrueR' % conLBank)
        cmds.connectAttr('%s.outColorR' % conLBank, suffix + 'grp_rbank' + orient[2])
        cmds.connectAttr(footControl +'.foot_bank', '%s.firstTerm' % conRBank)
        cmds.connectAttr(footControl +'.foot_bank', '%s.colorIfTrueR' % conRBank)
        cmds.connectAttr('%s.outColorR' % conRBank, suffix + 'grp_lbank' + orient[2])

        return footNodes