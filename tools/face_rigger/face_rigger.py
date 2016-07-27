import maya.cmds as cmds
import json
import system.utils as utils
import pymel.core as pm
import os

class Face_Rigger:

    def __init__(self):
        print "Face Rigger"

    def ui(self, *args):
        print "In UI"
        self.UIElements = {}

        self.windowName = "VV_FaceRigger"
        if cmds.window(self.windowName, exists=True):
            cmds.deleteUI(self.windowName)
        """ Define UI elements width and height """
        self.windowWidth = 340
        self.windowHeight = 120

        self.buttonWidth = 340
        self.buttonHeight = 30

        self.UIElements["window"] = cmds.window(self.windowName, width=self.windowWidth, height=self.windowHeight,
                                    title="VV_FaceRigger", tlb=True, sizeable=True, mxb=False, mnb=False)

        self.UIElements["rowAFlowLayout"] = cmds.flowLayout(v=True, width=self.windowWidth, height=self.windowHeight, bgc=[0.3, 0.3, 0.3], p=self.UIElements["window"])

        self.UIElements['rootname_textfield'] = cmds.textField(width=self.windowWidth)
        self.UIElements['chval_textfield'] = cmds.textField(width=self.windowWidth)
        annotation = " Create a follicle setup on the selected surface"
        self.UIElements["folctrlbutton"] = cmds.button(label='Create Follicle Setup', p=self.UIElements["rowAFlowLayout"],
                                           w=self.buttonWidth,  bgc=[0.3, 0.3, 0.3], ann=annotation, c=self.createFollicleCtrlSetup)

        annotation = " Attach a follicle setup to a main control"
        self.UIElements["ctrlattachbutton"] = cmds.button(label='Attach Setup To Main', p=self.UIElements["rowAFlowLayout"],
                                           w=self.buttonWidth,  bgc=[0.3, 0.3, 0.3], ann=annotation, c=self.connectMajorToMinor)

        annotation = " Rig the face"
        self.UIElements["rigfacelbutton"] = cmds.button(label='Rig The Face', p=self.UIElements["rowAFlowLayout"],
                                           w=self.buttonWidth,  bgc=[0.3, 0.3, 0.3], ann=annotation, c=self.doFaceRig)

        self.UIElements["lockattrbutton"] = cmds.button(label='Lock Attrs', p=self.UIElements["rowAFlowLayout"],
                                           w=self.buttonWidth,  bgc=[0.3, 0.3, 0.3], ann=annotation, c=self.lockControls)

        self.UIElements["loadlimitbutton"] = cmds.button(label='Load Limits', p=self.UIElements["rowAFlowLayout"],
                                           w=self.buttonWidth,  bgc=[0.3, 0.3, 0.3], ann=annotation, c=self.loadLimits)

        """ Show the window"""
        cmds.showWindow(self.windowName)

    def createFollicleCtrlSetup(self, *args):
        if cmds.ls(sl=True) == []:
            return cmds.headsUpMessage( 'Select a surface' )
        fol = self.create_follicle(pm.selected()[0], 'None', 0.5, 0.5)

        rootname =  cmds.textField(self.UIElements['rootname_textfield'], q=True, text=True)
        self.createControlStructure(rootname, fol, 'None')

    def create_follicle(self, oNurbs, name, uPos=0.0, vPos=0.0, *args):
        # manually place and connect a follicle onto a nurbs surface.
        if oNurbs.type() == 'transform':
            oNurbs = oNurbs.getShape()
        elif oNurbs.type() == 'nurbsSurface':
            pass
        else:
            'Warning: Input must be a nurbs surface.'
            return False

        # create a name with frame padding
        if name == 'None':
            pName = '_'.join((oNurbs.name(),'follicle','#'.zfill(2)))
        else:
            pName = name

        if "Shape" in pName:
            pName = pName.replace("Shape", "")

        oFoll = pm.createNode('follicle', name=pName+'Shape')

        try:
            cmds.setAttr(pName+'Shape.visibility', 0)
        except: pass

        oNurbs.local.connect(oFoll.inputSurface)
        # if using a polygon mesh, use this line instead.
        # (The polygons will need to have UVs in order to work.)
        #oMesh.outMesh.connect(oFoll.inMesh)

        oNurbs.worldMatrix[0].connect(oFoll.inputWorldMatrix)
        oFoll.outRotate.connect(oFoll.getParent().rotate)
        oFoll.outTranslate.connect(oFoll.getParent().translate)
        oFoll.parameterU.set(uPos)
        oFoll.parameterV.set(vPos)
        oFoll.getParent().t.lock()
        oFoll.getParent().r.lock()

        try:
            params =  cmds.listAttr(oFoll, k=True)
            oFoll = oFoll.replace('Shape', '')
            paramList = ('parameterU', 'parameterV')
            for p in params:
                if p not in paramList:
                    try:
                        cmds.setAttr(oFoll+'.'+p, k=False)
                    except:
                        print p
        except: pass

        fol = oFoll.replace('Shape', '')

        return (oFoll, fol)

    def createControlStructure(self, rootname, fol, orient, *args):
        folpos = cmds.xform(fol[1], q=True, ws=True, t=True)
        uv = cmds.getAttr('%s.parameterU' % fol[0])
        vv = cmds.getAttr('%s.parameterV' % fol[0])

        pma = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pma_surf_%s' % rootname)
        cmds.setAttr('%s.input3D[0].input3Dx' % pma, uv)
        cmds.setAttr('%s.input3D[0].input3Dy' % pma, vv)

        lctroffset = cmds.spaceLocator(n='lctrOffset_%s' % rootname)
        lctroffsettrans = cmds.spaceLocator(n='lctrOffsetTrans_%s' % rootname)
        lctroffsetrot = cmds.spaceLocator(n='lctrOffsetRot_%s' % rootname)
        lctroffsetscale = cmds.spaceLocator(n='lctrOffsetScale_%s' % rootname)
        lctrsdk = cmds.spaceLocator(n='lctrSDK_%s' % rootname)

        locs = [lctroffset, lctroffsettrans, lctroffsetrot, lctroffsetscale, lctrsdk]
        for l in locs:
            cmds.setAttr('%sShape.visibility' % l[0], 0)

        grp = cmds.group(n='ZERO_grp_%s' % rootname, em=True)

        jnt = cmds.joint(n='rigj_%s' % rootname)
        cmds.setAttr('%s.visibility' % jnt, 0)

        ctrl = cmds.sphere(n='ctrl_%s' % rootname, r=0.01)
        #ctrlshape = cmds.createNode('clCircle', n='ctrl_%s' % rootname +'Shape')
        #ctrlsp = cmds.listRelatives(ctrlshape, p=True)[0]
        #ctrl = 'ctrl_%s' % rootname
        #cmds.rename(ctrlsp, ctrl)
        cmds.parent(jnt, ctrl[0])
        cmds.parent(ctrl[0], lctrsdk)
        cmds.parent(lctrsdk, lctroffsetscale)
        cmds.parent(lctroffsetscale, lctroffsetrot)
        cmds.parent(lctroffsetrot, lctroffsettrans)
        cmds.parent(lctroffsettrans, lctroffset)
        cmds.parent(lctroffset, grp)
        cmds.parent(grp, fol[1])

        cmds.xform(grp, ws=True, t=folpos)
        # HACK
        tmpcon = cmds.pointConstraint(fol, grp, mo=False)
        cmds.delete(tmpcon)
        cmds.connectAttr('%s.output3D.output3Dx' % pma, '%s.parameterV' % fol[0] )
        cmds.connectAttr('%s.output3D.output3Dy' % pma, '%s.parameterU' % fol[0] )

        if orient != 'None':
            #cmds.xform(grp, ws=True, ro=orient)
            tmpcon = cmds.parentConstraint(orient, grp, mo=False)
            cmds.delete(tmpcon)

        return([pma, locs, grp, jnt, ctrl[0]])

    def connectMajorToMinor(self, rootname, chvals=[['.tx', '.ty', '.tz'], ['None', 'None', 'None'],['translate']], *args):
        tv = cmds.textField(self.UIElements['chval_textfield'], q=True, text=True)

        if len(tv) > 0:
            chvals = tv
            import ast
            chvals = ast.literal_eval(chvals)

        if len (cmds.ls(sl=True)) != 2:
            return cmds.headsUpMessage("Please select a control then shift select a folicle.")
        sel = cmds.ls(sl=True)

        # Identify the offset locators.
        lctroffsetrot = sel[1].replace('fol_', 'lctrOffsetRot_')
        lctroffsettrans = sel[1].replace('fol_', 'lctrOffsetTrans_')
        lctroffsetscale = sel[1].replace('fol_', 'lctrOffsetscale_')

        # Find the follicle control and generate attribute name.
        folrel = cmds.listRelatives(sel[1], c=True)[1]
        attrname = folrel.partition('_')[2]
        attrname = attrname.replace('grp_', '')

        if chvals[2][0] == 'translate':
            na = 'trans'
        if chvals[2][0] == 'rotate':
            na = 'rot'
        if chvals[2][0] == 'scale':
            na = 'scale'

        # Make an mdiv to offset the input value
        mdivname = "mdiv_offset_" + na + "_" + sel[1]
        mdiv = cmds.shadingNode("multiplyDivide", asUtility=True, n=mdivname)

        attrnsuffix_list = []
        # Add new offset attributes to major control.
        if chvals[1][0] != 'None':
            attrsuffix = chvals[1][0].replace('.', '_') + chvals[0][0].replace('.', '_')
            if [attrname, attrsuffix] not in attrnsuffix_list:
                attrnsuffix_list.append([attrname, attrsuffix])
                if cmds.attributeQuery(attrname + attrsuffix, node=sel[0], exists=True) == False:
                    cmds.addAttr(sel[0], shortName=attrname + attrsuffix, longName=attrname + attrsuffix, defaultValue=0.1, k=True)
                    cmds.connectAttr(sel[0]+ '.' + attrname + attrsuffix, mdiv + '.input2.input2X')
                    cmds.setAttr(sel[0]+ '.' + attrname + attrsuffix, .1)
                    cmds.connectAttr(sel[0] + chvals[0][0], mdiv + '.input1.input1X')
                    cmds.setAttr(sel[0]+ '.' + attrname + attrsuffix, keyable=False, cb=False)
            else:
                print sel[0]+attrsuffix+'_failed'

        if chvals[1][1] != 'None':
            attrsuffix = chvals[1][1].replace('.', '_') + chvals[0][1].replace('.', '_')
            if [attrname, attrsuffix] not in attrnsuffix_list:
                attrnsuffix_list.append([attrname, attrsuffix])
                if cmds.attributeQuery(attrname + attrsuffix, node=sel[0], exists=True) == False:
                    cmds.addAttr(sel[0], shortName=attrname + attrsuffix, longName=attrname + attrsuffix, defaultValue=0.1, k=True)
                    cmds.connectAttr(sel[0] + '.' + attrname + attrsuffix, mdiv + '.input2.input2Y')
                    cmds.setAttr(sel[0]+ '.' + attrname + attrsuffix, .1)
                    cmds.connectAttr(sel[0] + chvals[0][1], mdiv + '.input1.input1Y')
                    cmds.setAttr(sel[0]+ '.' + attrname + attrsuffix, keyable=False, cb=False)
            else:
                print sel[0]+attrsuffix+'_failed'

        if chvals[1][2] != 'None':
            attrsuffix = chvals[1][2].replace('.', '_') + chvals[0][2].replace('.', '_')
            if [attrname, attrsuffix] not in attrnsuffix_list:
                attrnsuffix_list.append([attrname, attrsuffix])
                if cmds.attributeQuery(attrname + attrsuffix, node=sel[0], exists=True) == False:
                    cmds.addAttr(sel[0], shortName=attrname + attrsuffix, longName=attrname + attrsuffix, defaultValue=0.1, k=True)
                    cmds.connectAttr(sel[0] + '.' + attrname + attrsuffix, mdiv + '.input2.input2Z')
                    cmds.setAttr(sel[0]+ '.' + attrname + attrsuffix, .1)
                    cmds.connectAttr(sel[0] + chvals[0][2], mdiv + '.input1.input1Z')
                    cmds.setAttr(sel[0]+ '.' + attrname + attrsuffix, keyable=False, cb=False)
            else:
                print sel[0]+attrsuffix+'_failed'

        # find the connected pma________________________________________.
        if cmds.nodeType(sel[1]) == 'transform':
            shape = cmds.listRelatives(sel[1], s=True)
            cons = cmds.listConnections(shape[0])
            for c in cons:
                if 'pma_' in c:
                    pmanode =  c
        else:
            return cmds.headsUpMessage('You need to select the folicle transform')

        # Find the next open pma input_______________________________.
        closed = [0]
        cons = cmds.listConnections(pmanode)
        for c in cons:
            if 'mdiv_offset' in c:
                conattrs = cmds.listConnections('%s.outputX' % c, p=True)
                pmacon = []
                for each in conattrs:
                    if 'pma_' in each:
                        if each not in pmacon:
                            pmacon.append(each)
                conattrnum = pmacon[0].partition('.input3D[')[2][0]
                if conattrnum not in closed:
                    closed.append(int(conattrnum))
        newval = max(closed)+1
        input = '[' + str(newval) +']'

        # Connect the mdiv to the pma
        #cmds.connectAttr('%s.outputX' % mdiv, pmanode + '.input3D' + input + '.input3Dx' )
        #cmds.connectAttr('%s.outputY' % mdiv, pmanode + '.input3D' + input + '.input3Dy' )
        #cmds.connectAttr('%s.outputZ' % mdiv, pmanode + '.input3D' + input + '.input3Dz' )

        pmaattrs = [pmanode + '.input3D' + input + '.input3Dx', pmanode + '.input3D' + input + '.input3Dy', pmanode + '.input3D' + input + '.input3Dz']
        mdattrs = ['%s.outputX' % mdiv, '%s.outputY' % mdiv, '%s.outputZ' % mdiv]
        mdinattrs = [mdiv + '.input1.input1X', mdiv + '.input1.input1Y', mdiv + '.input1.input1Z']
        for i in range(len(chvals[1])):
            if chvals[2][0] == 'translate':
                try:
                    print "Connecting "+ mdattrs[i] + ' to ' + pmaattrs[i]
                    cmds.connectAttr(mdattrs[i], pmaattrs[i])
                except: print "FAILED________________ "+ mdattrs[i] + ' to ' + pmaattrs[i]

            if chvals[2][0] == 'rotate':
                try:
                    if chvals[1][i] != 'None':
                        print "Connecting "+ mdattrs[i] + ' to ' + lctroffsetrot + chvals[1][i]
                        cmds.connectAttr(mdattrs[i], lctroffsetrot + chvals[1][i])
                except: print "FAILED______________ "+ mdattrs[i] + ' to ' + lctroffsetrot + chvals[1][i]

            if chvals[2][0] == 'scale':
                try:
                    print "Connecting "+ mdattrs[i] + ' to ' + lctroffsetscale + chvals[1][i]
                    cmds.connectAttr(mdattrs[i], lctroffsetscale + chvals[1][i])
                except: print "FAILED_____________________ "+ mdattrs[i] + ' to ' + lctroffsetscale + chvals[1][i]

    def doFaceRig(self, *args):
        face_data={}
        data = utils.readJson(os.environ["AR_DATA"] + '/tools/face_rigger/face_data_001.json')
        info = json.loads(data)

        # Create the base groups.
        worldgrp = 'World_grp_FAC_EDC'
        con =  cmds.listConnections(worldgrp, p=True)
        for c in con:
            attr = '.' + c.partition('.')[2]
            try:
                cmds.disconnectAttr(c, 'World_grp_FAC_EDC' + attr)
            except: pass

        mainctrlgrp = cmds.group(n='grp_ctrl_main_FAC_EDC', em=True)
        subctrlgrp = cmds.group(n='grp_ctrl_sub_FAC_EDC', em=True)
        cmds.parent(subctrlgrp, mainctrlgrp)
        plgrp = cmds.group(n='Part_Link_C_01_FACEDC', em=True)
        wslctr = cmds.spaceLocator(n='World_C_01_EDC_FACE')
        cmds.setAttr(wslctr[0] + '.visibility', 0)

        # Move surface and control group pivots.
        grppos_pairs = [['ctrl_fac_main', 'World_grp_FAC_EDC'], ['ctrl_mr_C_headTop', 'grp_surf_headTop'], ['ctrl_mr_C_headMid', 'grp_surf_headMid'],
                        ['ctrl_mr_C_headBtm', 'grp_surf_headBtm'], ['ctrl_mr_C_muzzle', 'ZERO_grp_surf_muzzleSubB'], ['ctrl_mr_C_muzzle', 'ZERO_grp_surf_muzzleSubA'],
                        ['ctrl_mr_C_muzzle', 'grp_surf_muzzleSubB'], ['ctrl_mr_C_muzzle', 'grp_surf_muzzleSubA'],
                        ['ctrl_mr_C_jaw', 'ZERO_grp_surf_jawSubA'], ['ctrl_mr_C_jaw', 'ZERO_grp_surf_jawSubB'], ['ctrl_mr_C_jaw', 'ZERO_grp_surf_jawSubC'],
                        ['ctrl_mr_C_jaw', 'grp_surf_jawSubA'], ['ctrl_mr_C_jaw', 'grp_surf_jawSubB'], ['ctrl_mr_C_jaw', 'grp_surf_jawSubC']]

        surfaces=[]
        follicles=[]
        controls=[]

        msurfaces=[]
        mfollicles=[]
        mcontrols=[]

        rigjnts = []
        # NOTE: Center surface pivots after inverse scale, and center to world before.
        mirror = True

        # Cleanup surfaces
        for key, value in info.iteritems():
            # Look for each surface.  If it exists, clean it up.
            if 'surf_' in key:
                pos = cmds.xform(key, q=True, ws=True, t=True)
                rot = cmds.xform(key, q=True, ws=True, ro=True)
                cmds.select(key)
                surfaces.append([key, pos, rot])
                surf = pm.ls(sl=True)[0]
                parentcon = cmds.listConnections(key, type='parentConstraint')
                if parentcon == None:
                    pass
                else:
                    cmds.delete(parentcon[0])

                scalecon = cmds.listConnections(key, type='scaleConstraint')
                if scalecon == None:
                    pass
                else:
                    cmds.delete(scalecon[0])
                cmds.delete(key, ch=True)
                cmds.xform(key, ws=True, t=pos)
                cmds.xform(key, ws=True, ro=rot)
                cmds.makeIdentity(key, apply=True)
                cmds.xform(key, ws=True, piv=[0.0, 0.0, 0.0])

                if mirror:
                    if '_C_' not in key:
                        mirrorsurf = key.replace('_L_', '_R_')
                        if cmds.objExists(mirrorsurf) == False:
                            cmds.duplicate(key, n=mirrorsurf)
                            cmds.select(mirrorsurf)
                            cmds.scale( -1, 1, 1, mirrorsurf)
                            pos = cmds.xform(mirrorsurf, q=True, ws=True, t=True)
                            rot = cmds.xform(mirrorsurf, q=True, ws=True, ro=True)
                            cmds.delete(mirrorsurf, ch=True)
                            cmds.xform(mirrorsurf, ws=True, t=pos)
                            cmds.xform(mirrorsurf, ws=True, ro=rot)

        # Move pivot points of surface groups
        for p in grppos_pairs:
            if cmds.objExists(p[0])==True:
                pos = cmds.xform(p[0], ws=True, q=True, t=True)
                cmds.xform(p[1], ws=True, piv=pos)
                cmds.makeIdentity(p[1], apply=True)

        # Make a container to hold the face rig stuff
        #utils.createRigContainer('C_01_', 'FACEDC')

        cmds.parent(mainctrlgrp, plgrp)

        # Create all of the folicles and minor controls
        for key, value in info.iteritems():
            # Look for each surface.  If it exists, clean it up.
            if 'surf_' in key:
                pos = cmds.xform(key, q=True, ws=True, t=True)
                rot = cmds.xform(key, q=True, ws=True, ro=True)
                cmds.select(key)
                surfaces.append([key, pos, rot])
                surf = pm.ls(sl=True)[0]
                parentcon = cmds.listConnections(key, type='parentConstraint')
                if parentcon == None:
                    pass
                else:
                    cmds.delete(parentcon[0])

                scalecon = cmds.listConnections(key, type='scaleConstraint')
                if scalecon == None:
                    pass
                else:
                    cmds.delete(scalecon[0])
                cmds.delete(key, ch=True)
                cmds.xform(key, ws=True, t=pos)
                cmds.xform(key, ws=True, ro=rot)
                cmds.makeIdentity(key, apply=True)
                cmds.xform(key, ws=True, piv=[0.0, 0.0, 0.0])

                if mirror:
                    if '_C_' not in key:
                        mirrorsurf = key.replace('_L_', '_R_')
                        if cmds.objExists(mirrorsurf) == False:
                            cmds.duplicate(key, n=mirrorsurf)
                            cmds.select(mirrorsurf)
                            cmds.scale( -1, 1, 1, mirrorsurf)
                            pos = cmds.xform(mirrorsurf, q=True, ws=True, t=True)
                            rot = cmds.xform(mirrorsurf, q=True, ws=True, ro=True)
                            cmds.delete(mirrorsurf, ch=True)
                            cmds.xform(mirrorsurf, ws=True, t=pos)
                            cmds.xform(mirrorsurf, ws=True, ro=rot)

                for item in info[key]['subcon']:
                    fname = item.replace('lyt_ctrl_', 'fol_')
                    rootname = item.replace('lyt_ctrl_', '')

                    # Find the UV values and offset.
                    fol = cmds.listRelatives(item, p=True)[0]
                    uval = cmds.getAttr('%sShape.parameterU' % fol)
                    vval = cmds.getAttr('%sShape.parameterV' % fol)

                    if cmds.objExists(fname) == False:
                        fol = self.create_follicle(surf, fname, vval, uval)
                        if fol[1] not in follicles:
                            follicles.append(fol[1])
                            # Hide the follicle and set no inherit transform
                            cmds.setAttr('%s.visibility' % fol[0], 0)
                            cmds.setAttr('%s.inheritsTransform' % fol[1], 0)

                        orient = item

                        ctrl_info = self.createControlStructure(rootname, fol, orient)
                        controls.append(ctrl_info)
                        rigjnts.append(ctrl_info[3])

                        if mirror:
                            msurf = key.replace('L_', 'R_')
                            cmds.select(msurf)
                            msurf = pm.ls(sl=True)[0]
                            mfname = fname.replace('L_', 'R_')
                            mrootname = rootname.replace('L_', 'R_')
                            if cmds.objExists(mfname) == False:
                                fol = self.create_follicle(msurf, mfname, vval, uval)
                                if fol[1] not in follicles:
                                    mfollicles.append(fol[1])
                                    cmds.setAttr('%s.visibility' % fol[0], 0)
                                    cmds.setAttr('%s.inheritsTransform' % fol[1], 0)

                                itempos = cmds.xform(item, q=True, ws=True, t=True)
                                itemrot = cmds.xform(item, q=True, ws=True, ro=True)
                                mitemname = item.replace('_L_', '_R_')
                                mloc = cmds.spaceLocator(n=mitemname)
                                cmds.xform(mloc, ws=True, t=[itempos[0], -itempos[1], itempos[2]])
                                cmds.xform(mloc, ws=True, ro=[itemrot[0], itemrot[1], -itemrot[2]])
                                orient = mloc
                                ctrl_info = self.createControlStructure(mrootname, fol, orient)
                                cmds.delete(mloc)
                                cmds.scale( 1, 1, 1, ctrl_info[2])
                                mcontrols.append(ctrl_info)
                                rigjnts.append(ctrl_info[3])
                                tc = cmds.pointConstraint(fol, ctrl_info[2], mo=False)
                                cmds.delete(tc)

        #########################################################################################################################
        for f in follicles:
            try:
                cmds.parent(f, subctrlgrp)
            except:
                pass

        if mirror:
            for f in mfollicles:
                try:
                    cmds.parent(f, subctrlgrp)
                except:
                    pass

        face_data[rootname] = {}
        face_data[rootname]['subctrls'] = controls
        face_data[rootname]['follicles'] = follicles
        face_data[rootname]['surfaces'] = surfaces

        if mirror:
            face_data[mrootname] = {}
            face_data[mrootname]['subctrls'] = mcontrols
            face_data[mrootname]['follicles'] = mfollicles
            face_data[mrootname]['surfaces'] = msurfaces

        #cmds.makeIdentity('World_grp_FAC_EDC', apply=True)

        # Create the Major controls.
        plnodes = [u'ctrl_mr_C_mouthUp', u'ctrl_mr_C_mouthDown', u'ctrl_mr_L_mouthCorner', u'ctrl_mr_C_muzzle',
                   u'ctrl_mr_L_nasal', u'ctrl_mr_C_brow', u'ctrl_mr_L_lidUp', u'ctrl_mr_L_lidLow', u'ctrl_mr_L_eye',
                   u'ctrl_mr_L_lidIn', u'ctrl_mr_L_lidOut', u'ctrl_mr_L_brow', u'ctrl_mr_L_cheek',
                   u'ctrl_mr_L_zygo',
                   u'ctrl_mr_L_mouthUp', u'ctrl_mr_L_mouthLow', u'ctrl_mr_C_jaw', u'ctrl_mr_C_headTop',
                   u'ctrl_mr_C_headMid',
                   u'ctrl_mr_C_headBtm', 'ctrl_mr_C_nose', 'ctrl_mr_L_nose', 'ctrl_mr_L_eyeRoot']

        controlnodedata = self.collectControlShapes(plnodes)
        mainctrls = []
        mainc = []
        for key in controlnodedata:

            ctrlpos = cmds.xform(key, q=True, ws=True, t=True)
            ctrlrot = cmds.xform(key, q=True, ws=True, ro=True)
            ctrlname = key.replace('_mr_', '_major_')

            if cmds.objExists(ctrlname):
                cmds.delete(ctrlname)
            cmds.circle(n=ctrlname, r=0.05, nr=[1, 0, 0])
            if cmds.objExists('grp_' + ctrlname):
                cmds.delete('grp_' + ctrlname)
            ctrlgrp = cmds.group(n='grp_' + ctrlname, em=True)
            if key == 'ctrl_mr_L_eye':
                lagrp = cmds.group(n='LOOKAT_' + ctrlname)
            if cmds.objExists('ZERO_grp_' + ctrlname):
                cmds.delete('ZERO_grp_' + ctrlname)
            zgrp = cmds.group(n='ZERO_grp_' + ctrlname)
            cmds.parent(ctrlname, ctrlgrp)
            cmds.select(d=True)
            if cmds.objExists(ctrlname.replace('ctrl_major_', 'rigj_')) == False:
                rjnt = cmds.joint(n=ctrlname.replace('ctrl_major_', 'rigj_'))
                cmds.setAttr('%s.visibility' % rjnt, 0)
                cmds.parent(rjnt, ctrlname)
            cmds.xform(zgrp, ws=True, t=ctrlpos)
            cmds.xform(zgrp, ws=True, ro=ctrlrot)
            mainctrls.append([ctrlname, ctrlgrp, zgrp, rjnt])
            mainc.append(ctrlname)

            # Do mirror side.
            if mirror:
                if '_C_' not in ctrlname:
                    mctrlname = ctrlname.replace('_L_', '_R_')

                    mctrlpos = [ctrlpos[0], -ctrlpos[1], ctrlpos[2]]
                    mctrlrot = [ctrlrot[0], -ctrlrot[1], -ctrlrot[2]]
                    if cmds.objExists(mctrlname):
                        cmds.delete(mctrlname)
                    ctrl = cmds.circle(n=mctrlname, r=0.05, nr=[1, 0, 0])
                    # ctrl = cmds.listRelatives(ctrlshape, p=True)
                    # cmds.rename(ctrl, mctrlname)
                    if cmds.objExists('grp_' + mctrlname):
                        cmds.delete('grp_' + mctrlname)
                    ctrlgrp = cmds.group(n='grp_' + mctrlname, em=True)
                    if key == 'ctrl_mr_L_eye':
                        lagrp = cmds.group(n='LOOKAT_' + mctrlname)
                    if cmds.objExists('ZERO_grp_' + mctrlname):
                        cmds.delete('ZERO_grp_' + mctrlname)
                    zgrp = cmds.group(n='ZERO_grp_' + mctrlname)
                    cmds.parent(mctrlname, ctrlgrp)
                    cmds.select(d=True)
                    if cmds.objExists(mctrlname.replace('ctrl_major_', 'rigj_')) == False:
                        rjnt = cmds.joint(n=mctrlname.replace('ctrl_major_', 'rigj_'))
                        cmds.setAttr('%s.visibility' % rjnt, 0)
                        cmds.parent(rjnt, mctrlname)
                    cmds.xform(zgrp, ws=True, t=mctrlpos)
                    cmds.xform(zgrp, ws=True, ro=mctrlrot)
                    # cmds.scale( -1, 1, 1, zgrp)
                    mainctrls.append([mctrlname, ctrlgrp, zgrp, rjnt])
                    mainc.append(mctrlname)

        for key in controlnodedata:
            if key == 'ctrl_mr_L_nose':
                cmds.parent('ZERO_grp_ctrl_major_L_nose', 'ctrl_major_C_nose')
            if key == 'ctrl_mr_L_eyeRoot':
                cmds.parent('ZERO_grp_ctrl_major_L_lidUp', 'ZERO_grp_ctrl_major_L_lidLow',
                            'ZERO_grp_ctrl_major_L_eye',
                            'ZERO_grp_ctrl_major_L_lidIn', 'ZERO_grp_ctrl_major_L_lidOut', 'ctrl_major_L_eyeRoot')
            if key == 'ctrl_mr_L_nose':
                cmds.parent('ZERO_grp_ctrl_major_R_nose', 'ctrl_major_C_nose')
            if key == 'ctrl_mr_L_eyeRoot':
                cmds.parent('ZERO_grp_ctrl_major_R_lidUp', 'ZERO_grp_ctrl_major_R_lidLow',
                            'ZERO_grp_ctrl_major_R_eye',
                            'ZERO_grp_ctrl_major_R_lidIn', 'ZERO_grp_ctrl_major_R_lidOut', 'ctrl_major_R_eyeRoot')

        face_data['maincontrols'] = mainc

        self.loadControlShapes(controlnodedata)

        # Connect the minors to the major controls
        for key, value in info.iteritems():
            if info[key]['major'][0] != 'None':
                # for i in range(len(info[key]['minor'])):
                if type(info[key]['minor'][0]) is list:
                    lstlen = len(info[key]['minor'])

                    for i in range(lstlen):
                        for item in info[key]['minor'][i]:
                            fname = item.replace('lyt_ctrl_', 'fol_')
                            rootname = item.replace('lyt_ctrl_', '')
                            if cmds.objExists(fname) == True:
                                cmds.select(info[key]['major'][i])
                                cmds.select(fname, add=True)
                                # chvals dictates if rotate or translate is connected
                                chvals = info[key]['chvals']
                                self.connectMajorToMinor(rootname, chvals)
                            if mirror and '_C_' not in fname:
                                mfname = fname.replace('_L_', '_R_')
                                rootname = rootname.replace('_L_', '_R_')
                                if cmds.objExists(mfname) == True:
                                    mmajor = info[key]['major'][i].replace('_L_', '_R_')
                                    cmds.select(mmajor)
                                    cmds.select(mfname, add=True)
                                    chvals = info[key]['chvals']
                                    self.connectMajorToMinor(rootname, chvals)

                else:
                    for i in range(len(info[key]['minor'])):
                        fname = info[key]['minor'][i].replace('lyt_ctrl_', 'fol_')
                        rootname = info[key]['minor'][i].replace('lyt_ctrl_', '')
                        if cmds.objExists(fname) == True:
                            cmds.select(info[key]['major'])
                            cmds.select(fname, add=True)
                            chvals = info[key]['chvals']
                            self.connectMajorToMinor(rootname, chvals)
                        if mirror and '_C_' not in fname:
                            mfname = fname.replace('_L_', '_R_')
                            rootname = rootname.replace('_L_', '_R_')
                            if cmds.objExists(mfname) == True:
                                mmajor = info[key]['major'][0].replace('_L_', '_R_')
                                cmds.select(mmajor)
                                cmds.select(mfname, add=True)
                                chvals = info[key]['chvals']
                                self.connectMajorToMinor(rootname, chvals)

                # Make the minor vis attributes
                if cmds.attributeQuery('Minor_Vis', node=info[key]['major'][0], exists=True) == False:
                    cmds.addAttr(info[key]['major'][0], shortName='Minor_Vis', longName='Minor_Vis', at="enum",
                                 en="off:on:", k=True)
                    cmds.setAttr(info[key]['major'][0] + '.Minor_Vis', keyable=False, cb=True)
                for i in range(len(info[key]['subcon'])):
                    if info[key]['subcon'][i] != 'None':
                        grname = info[key]['subcon'][i].replace('lyt_ctrl_', 'ZERO_grp_')
                        try:
                            cmds.connectAttr(info[key]['major'][0] + '.Minor_Vis', grname + '.visibility')
                            if mirror:
                                if cmds.attributeQuery('Minor_Vis', node=mmajor, exists=True) == False:
                                    cmds.addAttr(mmajor, shortName='Minor_Vis', longName='Minor_Vis', at="enum",
                                                 en="off:on:", k=True)
                                    cmds.setAttr(mmajor + '.Minor_Vis', keyable=False, cb=True)
                                try:
                                    tmpname = info[key]['subcon'][i].replace('lyt_ctrl_', 'ZERO_grp_')
                                    grname = tmpname.replace('_L_', '_R_')
                                    cmds.connectAttr(mmajor + '.Minor_Vis', grname + '.visibility')
                                except:
                                    pass
                        except: pass

        # Connect jaw head zones and muzzle.
        # Define ctrl group pairings.
        jawgrpA = ['grp_C_jawFollowA', ['ZERO_grp_ctrl_major_C_mouthDown']]
        jawgrpB = ['grp_C_jawFollowB', ['ZERO_grp_ctrl_major_L_mouthLow']]
        jawgrpC = ['grp_C_jawFollowC', ['ZERO_grp_ctrl_major_L_mouthCorner']]
        muzzlegrpA = ['grp_C_muzzleFollowA',
                      ['ZERO_grp_C_jawFollowA', 'ZERO_grp_C_jawFollowB', 'ZERO_grp_ctrl_major_C_mouthUp',
                       'ZERO_grp_ctrl_major_C_muzzle', 'ZERO_grp_ctrl_major_L_mouthUp',
                       'ZERO_grp_ctrl_major_L_mouthCorner', 'ZERO_grp_ctrl_major_C_jaw']]
        muzzlegrpB = ['grp_C_muzzleFollowB', ['ZERO_grp_ctrl_major_L_nasal', 'ZERO_grp_ctrl_major_L_zygo']]

        # Jaw
        jfzgrppos = cmds.xform('ctrl_major_C_jaw', q=True, ws=True, t=True)
        jfzgrprot = cmds.xform('ctrl_major_C_jaw', q=True, ws=True, ro=True)
        jawfolgrps = [['grp_C_jawFollowA', 'ZERO_grp_C_jawFollowA'], ['grp_C_jawFollowB', 'ZERO_grp_C_jawFollowB'],
                      ['grp_C_jawFollowC', 'ZERO_grp_C_jawFollowC']]
        for grp in jawfolgrps:
            cmds.group(n=grp[0], em=True)
            cmds.group(n=grp[1])
            cmds.xform(grp[1], ws=True, t=jfzgrppos)
            cmds.xform(grp[1], ws=True, ro=jfzgrprot)
            cmds.parent(grp[1], 'ctrl_major_C_headBtm')

        for e in jawgrpA[1]:
            cmds.parent(e, jawgrpA[0])
            if mirror:
                if '_L_' in e:
                    me = e.replace('_L_', '_R_')
                    cmds.parent(me, jawgrpA[0])

        for e in jawgrpB[1]:
            cmds.parent(e, jawgrpB[0])
            if mirror:
                if '_L_' in e:
                    me = e.replace('_L_', '_R_')
                    cmds.parent(me, jawgrpB[0])

        # Muzzle
        muzgrppos = cmds.xform('ctrl_major_C_muzzle', q=True, ws=True, t=True)
        muzgrprot = cmds.xform('ctrl_major_C_muzzle', q=True, ws=True, ro=True)
        muzlfolgrps = [['grp_C_muzzleFollowA', 'ZERO_grp_C_muzzleFollowA'],
                       ['grp_C_muzzleFollowB', 'ZERO_grp_C_muzzleFollowB']]
        for grp in muzlfolgrps:
            cmds.group(n=grp[0], em=True)
            cmds.group(n=grp[1])
            cmds.xform(grp[1], ws=True, t=muzgrppos)
            cmds.xform(grp[1], ws=True, ro=muzgrprot)
            cmds.parent(grp[1], 'ctrl_major_C_headBtm')

        for e in muzzlegrpA[1]:
            cmds.parent(e, muzzlegrpA[0])
            if mirror:
                if '_L_' in e:
                    me = e.replace('_L_', '_R_')
                    cmds.parent(me, muzzlegrpA[0])

        for e in muzzlegrpB[1]:
            cmds.parent(e, muzzlegrpB[0])
            if mirror:
                if '_L_' in e:
                    me = e.replace('_L_', '_R_')
                    cmds.parent(me, muzzlegrpB[0])

        mnrigj = []
        headbtm = ['ctrl_major_C_headBtm', ['ZERO_grp_C_muzzleFollowA']]
        headmid = ['ctrl_major_C_headMid',
                   ['ZERO_grp_C_muzzleFollowB', 'ZERO_grp_ctrl_major_L_cheek', 'ZERO_grp_ctrl_major_C_nose']]
        headtop = ['ctrl_major_C_headTop',
                   ['ZERO_grp_ctrl_major_L_eye', 'ZERO_grp_ctrl_major_L_brow', 'ZERO_grp_ctrl_major_C_brow',
                    'ZERO_grp_ctrl_major_L_eyeRoot']]

        for e in headmid[1]:
            try:
                cmds.parent(e, headmid[0])
                if mirror:
                    if '_L_' in e:
                        me = e.replace('_L_', '_R_')
                        cmds.parent(me, headmid[0])
            except:
                pass

        cmds.parent('ZERO_grp_' + headmid[0], mainctrlgrp)
        cmds.select(d=True)

        for e in headbtm[1]:
            try:
                cmds.parent(e, headbtm[0])
                if mirror:
                    if '_L_' in e:
                        me = e.replace('_L_', '_R_')
                        cmds.parent(me, headbtm[0])
            except:
                pass

        cmds.parent('ZERO_grp_' + headbtm[0], mainctrlgrp)
        cmds.select(d=True)

        for e in headtop[1]:
            try:
                cmds.parent(e, headtop[0])
                if mirror:
                    if '_L_' in e:
                        me = e.replace('_L_', '_R_')
                        cmds.parent(me, headtop[0])
            except:
                pass

        cmds.parent('ZERO_grp_' + headtop[0], mainctrlgrp)
        cmds.select(d=True)

        # Connect the Jaw.
        cmds.addAttr('ctrl_major_C_jaw', shortName='falloff', longName='falloff', defaultValue=.5, min=0, max=1,
                     k=True)
        # MouthLow
        print "__________________________________________________________________________________________________"
        jawpmarot = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pma_blendrot_jaw')
        jawmdivrot = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdiv_blendrot_jaw')
        cmds.connectAttr('%s.outputX' % jawmdivrot, jawpmarot + '.input3D[0].input3Dx')
        cmds.connectAttr('%s.outputY' % jawmdivrot, jawpmarot + '.input3D[0].input3Dy')
        cmds.connectAttr('%s.outputZ' % jawmdivrot, jawpmarot + '.input3D[0].input3Dz')
        cmds.connectAttr('ctrl_major_C_jaw.rx', jawmdivrot + '.input1X')
        cmds.connectAttr('ctrl_major_C_jaw.ry', jawmdivrot + '.input1Y')
        cmds.connectAttr('ctrl_major_C_jaw.rz', jawmdivrot + '.input1Z')
        cmds.connectAttr('ctrl_major_C_jaw.falloff', jawmdivrot + '.input2X')
        cmds.connectAttr('ctrl_major_C_jaw.falloff', jawmdivrot + '.input2Y')
        cmds.connectAttr('ctrl_major_C_jaw.falloff', jawmdivrot + '.input2Z')
        cmds.connectAttr('%s.output3Dx' % jawpmarot, '%s.rx' % 'grp_surf_jawSubB')
        cmds.connectAttr('%s.output3Dy' % jawpmarot, '%s.ry' % 'grp_surf_jawSubB')
        cmds.connectAttr('%s.output3Dz' % jawpmarot, '%s.rz' % 'grp_surf_jawSubB')
        cmds.connectAttr('%s.output3Dx' % jawpmarot, '%s.rx' % 'grp_C_jawFollowB')
        cmds.connectAttr('%s.output3Dy' % jawpmarot, '%s.ry' % 'grp_C_jawFollowB')
        cmds.connectAttr('%s.output3Dz' % jawpmarot, '%s.rz' % 'grp_C_jawFollowB')

        jawpmapos = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pma_blendpos_jaw')
        jawmdivpos = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdiv_blendpos_jaw')
        cmds.connectAttr('%s.outputX' % jawmdivpos, jawpmapos + '.input3D[0].input3Dx')
        cmds.connectAttr('%s.outputY' % jawmdivpos, jawpmapos + '.input3D[0].input3Dy')
        cmds.connectAttr('%s.outputZ' % jawmdivpos, jawpmapos + '.input3D[0].input3Dz')
        cmds.connectAttr('ctrl_major_C_jaw.tx', jawmdivpos + '.input1X')
        cmds.connectAttr('ctrl_major_C_jaw.ty', jawmdivpos + '.input1Y')
        cmds.connectAttr('ctrl_major_C_jaw.tz', jawmdivpos + '.input1Z')
        cmds.connectAttr('ctrl_major_C_jaw.falloff', jawmdivpos + '.input2X')
        cmds.connectAttr('ctrl_major_C_jaw.falloff', jawmdivpos + '.input2Y')
        cmds.connectAttr('ctrl_major_C_jaw.falloff', jawmdivpos + '.input2Z')
        cmds.connectAttr('%s.output3Dx' % jawpmapos, '%s.tx' % 'grp_surf_jawSubB')
        cmds.connectAttr('%s.output3Dy' % jawpmapos, '%s.ty' % 'grp_surf_jawSubB')
        cmds.connectAttr('%s.output3Dz' % jawpmapos, '%s.tz' % 'grp_surf_jawSubB')
        cmds.connectAttr('%s.output3Dx' % jawpmapos, '%s.tx' % 'grp_C_jawFollowB')
        cmds.connectAttr('%s.output3Dy' % jawpmapos, '%s.ty' % 'grp_C_jawFollowB')
        cmds.connectAttr('%s.output3Dz' % jawpmapos, '%s.tz' % 'grp_C_jawFollowB')

        # Mouth Corner
        cmds.addAttr('ctrl_major_C_jaw', shortName='falloff_corner', longName='falloff_corner', defaultValue=.5,
                     min=0, max=1, k=True)
        jawpmarot = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pma_blendrot_jawC')
        jawmdivrot = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdiv_blendrot_jawC')
        cmds.connectAttr('%s.outputX' % jawmdivrot, jawpmarot + '.input3D[0].input3Dx')
        cmds.connectAttr('%s.outputY' % jawmdivrot, jawpmarot + '.input3D[0].input3Dy')
        cmds.connectAttr('%s.outputZ' % jawmdivrot, jawpmarot + '.input3D[0].input3Dz')
        cmds.connectAttr('ctrl_major_C_jaw.rx', jawmdivrot + '.input1X')
        cmds.connectAttr('ctrl_major_C_jaw.ry', jawmdivrot + '.input1Y')
        cmds.connectAttr('ctrl_major_C_jaw.rz', jawmdivrot + '.input1Z')
        cmds.connectAttr('ctrl_major_C_jaw.falloff_corner', jawmdivrot + '.input2X')
        cmds.connectAttr('ctrl_major_C_jaw.falloff_corner', jawmdivrot + '.input2Y')
        cmds.connectAttr('ctrl_major_C_jaw.falloff_corner', jawmdivrot + '.input2Z')
        cmds.connectAttr('%s.output3Dx' % jawpmarot, '%s.rx' % 'grp_surf_jawSubC')
        cmds.connectAttr('%s.output3Dy' % jawpmarot, '%s.ry' % 'grp_surf_jawSubC')
        cmds.connectAttr('%s.output3Dz' % jawpmarot, '%s.rz' % 'grp_surf_jawSubC')
        cmds.connectAttr('%s.output3Dx' % jawpmarot, '%s.rx' % 'grp_C_jawFollowC')
        cmds.connectAttr('%s.output3Dy' % jawpmarot, '%s.ry' % 'grp_C_jawFollowC')
        cmds.connectAttr('%s.output3Dz' % jawpmarot, '%s.rz' % 'grp_C_jawFollowC')

        jawpmapos = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pma_blendpos_jawC')
        jawmdivpos = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdiv_blendpos_jawC')
        cmds.connectAttr('%s.outputX' % jawmdivpos, jawpmapos + '.input3D[0].input3Dx')
        cmds.connectAttr('%s.outputY' % jawmdivpos, jawpmapos + '.input3D[0].input3Dy')
        cmds.connectAttr('%s.outputZ' % jawmdivpos, jawpmapos + '.input3D[0].input3Dz')
        cmds.connectAttr('ctrl_major_C_jaw.tx', jawmdivpos + '.input1X')
        cmds.connectAttr('ctrl_major_C_jaw.ty', jawmdivpos + '.input1Y')
        cmds.connectAttr('ctrl_major_C_jaw.tz', jawmdivpos + '.input1Z')
        cmds.connectAttr('ctrl_major_C_jaw.falloff', jawmdivpos + '.input2X')
        cmds.connectAttr('ctrl_major_C_jaw.falloff', jawmdivpos + '.input2Y')
        cmds.connectAttr('ctrl_major_C_jaw.falloff', jawmdivpos + '.input2Z')
        cmds.connectAttr('%s.output3Dx' % jawpmapos, '%s.tx' % 'grp_surf_jawSubC')
        cmds.connectAttr('%s.output3Dy' % jawpmapos, '%s.ty' % 'grp_surf_jawSubC')
        cmds.connectAttr('%s.output3Dz' % jawpmapos, '%s.tz' % 'grp_surf_jawSubC')
        cmds.connectAttr('%s.output3Dx' % jawpmapos, '%s.tx' % 'grp_C_jawFollowC')
        cmds.connectAttr('%s.output3Dy' % jawpmapos, '%s.ty' % 'grp_C_jawFollowC')
        cmds.connectAttr('%s.output3Dz' % jawpmapos, '%s.tz' % 'grp_C_jawFollowC')

        cmds.connectAttr('ctrl_major_C_jaw.rx', 'grp_surf_jawSubA.rx')
        cmds.connectAttr('ctrl_major_C_jaw.ry', 'grp_surf_jawSubA.ry')
        cmds.connectAttr('ctrl_major_C_jaw.rz', 'grp_surf_jawSubA.rz')
        cmds.connectAttr('ctrl_major_C_jaw.tx', 'grp_surf_jawSubA.tx')
        cmds.connectAttr('ctrl_major_C_jaw.ty', 'grp_surf_jawSubA.ty')
        cmds.connectAttr('ctrl_major_C_jaw.tz', 'grp_surf_jawSubA.tz')
        cmds.connectAttr('ctrl_major_C_jaw.rx', 'grp_C_jawFollowA.rx')
        cmds.connectAttr('ctrl_major_C_jaw.ry', 'grp_C_jawFollowA.ry')
        cmds.connectAttr('ctrl_major_C_jaw.rz', 'grp_C_jawFollowA.rz')
        cmds.connectAttr('ctrl_major_C_jaw.tx', 'grp_C_jawFollowA.tx')
        cmds.connectAttr('ctrl_major_C_jaw.ty', 'grp_C_jawFollowA.ty')
        cmds.connectAttr('ctrl_major_C_jaw.tz', 'grp_C_jawFollowA.tz')

        # Connect the Muzzle.
        cmds.addAttr('ctrl_major_C_muzzle', shortName='falloff', longName='falloff', defaultValue=.5, min=0, max=1,
                     k=True)

        muzzlepmarot = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pma_blendrot_muzzle')
        muzzlemdivrot = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdiv_blendrot_muzzle')
        cmds.connectAttr('%s.outputX' % muzzlemdivrot, muzzlepmarot + '.input3D[0].input3Dx')
        cmds.connectAttr('%s.outputY' % muzzlemdivrot, muzzlepmarot + '.input3D[0].input3Dy')
        cmds.connectAttr('%s.outputZ' % muzzlemdivrot, muzzlepmarot + '.input3D[0].input3Dz')
        cmds.connectAttr('ctrl_major_C_muzzle.rx', muzzlemdivrot + '.input1X')
        cmds.connectAttr('ctrl_major_C_muzzle.ry', muzzlemdivrot + '.input1Y')
        cmds.connectAttr('ctrl_major_C_muzzle.rz', muzzlemdivrot + '.input1Z')
        cmds.connectAttr('ctrl_major_C_muzzle.falloff', muzzlemdivrot + '.input2X')
        cmds.connectAttr('ctrl_major_C_muzzle.falloff', muzzlemdivrot + '.input2Y')
        cmds.connectAttr('ctrl_major_C_muzzle.falloff', muzzlemdivrot + '.input2Z')
        cmds.connectAttr('%s.output3Dx' % muzzlepmarot, '%s.rx' % 'grp_surf_muzzleSubB')
        cmds.connectAttr('%s.output3Dy' % muzzlepmarot, '%s.ry' % 'grp_surf_muzzleSubB')
        cmds.connectAttr('%s.output3Dz' % muzzlepmarot, '%s.rz' % 'grp_surf_muzzleSubB')
        cmds.connectAttr('%s.output3Dx' % muzzlepmarot, '%s.rx' % 'grp_C_muzzleFollowB')
        cmds.connectAttr('%s.output3Dy' % muzzlepmarot, '%s.ry' % 'grp_C_muzzleFollowB')
        cmds.connectAttr('%s.output3Dz' % muzzlepmarot, '%s.rz' % 'grp_C_muzzleFollowB')

        muzzlepmapos = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pma_blendrot_muzzle')
        muzzlemdivpos = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdiv_blendrot_muzzle')
        cmds.connectAttr('%s.outputX' % muzzlemdivpos, muzzlepmapos + '.input3D[0].input3Dx')
        cmds.connectAttr('%s.outputY' % muzzlemdivpos, muzzlepmapos + '.input3D[0].input3Dy')
        cmds.connectAttr('%s.outputZ' % muzzlemdivpos, muzzlepmapos + '.input3D[0].input3Dz')
        cmds.connectAttr('ctrl_major_C_muzzle.tx', muzzlemdivpos + '.input1X')
        cmds.connectAttr('ctrl_major_C_muzzle.ty', muzzlemdivpos + '.input1Y')
        cmds.connectAttr('ctrl_major_C_muzzle.tz', muzzlemdivpos + '.input1Z')
        cmds.connectAttr('ctrl_major_C_muzzle.falloff', muzzlemdivpos + '.input2X')
        cmds.connectAttr('ctrl_major_C_muzzle.falloff', muzzlemdivpos + '.input2Y')
        cmds.connectAttr('ctrl_major_C_muzzle.falloff', muzzlemdivpos + '.input2Z')
        cmds.connectAttr('%s.output3Dx' % muzzlepmapos, '%s.tx' % 'grp_surf_muzzleSubB')
        cmds.connectAttr('%s.output3Dy' % muzzlepmapos, '%s.ty' % 'grp_surf_muzzleSubB')
        cmds.connectAttr('%s.output3Dz' % muzzlepmapos, '%s.tz' % 'grp_surf_muzzleSubB')
        cmds.connectAttr('%s.output3Dx' % muzzlepmapos, '%s.tx' % 'grp_C_muzzleFollowB')
        cmds.connectAttr('%s.output3Dy' % muzzlepmapos, '%s.ty' % 'grp_C_muzzleFollowB')
        cmds.connectAttr('%s.output3Dz' % muzzlepmapos, '%s.tz' % 'grp_C_muzzleFollowB')

        cmds.connectAttr('ctrl_major_C_muzzle.rx', 'grp_surf_muzzleSubA.rx')
        cmds.connectAttr('ctrl_major_C_muzzle.ry', 'grp_surf_muzzleSubA.ry')
        cmds.connectAttr('ctrl_major_C_muzzle.rz', 'grp_surf_muzzleSubA.rz')
        cmds.connectAttr('ctrl_major_C_muzzle.tx', 'grp_surf_muzzleSubA.tx')
        cmds.connectAttr('ctrl_major_C_muzzle.ty', 'grp_surf_muzzleSubA.ty')
        cmds.connectAttr('ctrl_major_C_muzzle.tz', 'grp_surf_muzzleSubA.tz')
        cmds.connectAttr('ctrl_major_C_muzzle.rx', 'grp_C_muzzleFollowA.rx')
        cmds.connectAttr('ctrl_major_C_muzzle.ry', 'grp_C_muzzleFollowA.ry')
        cmds.connectAttr('ctrl_major_C_muzzle.rz', 'grp_C_muzzleFollowA.rz')
        cmds.connectAttr('ctrl_major_C_muzzle.tx', 'grp_C_muzzleFollowA.tx')
        cmds.connectAttr('ctrl_major_C_muzzle.ty', 'grp_C_muzzleFollowA.ty')
        cmds.connectAttr('ctrl_major_C_muzzle.tz', 'grp_C_muzzleFollowA.tz')

        cmds.parentConstraint('ctrl_major_C_headTop', 'grp_surf_headTop', mo=True)
        cmds.scaleConstraint('ctrl_major_C_headTop', 'grp_surf_headTop', mo=True)

        cmds.parentConstraint('ctrl_major_C_headMid', 'grp_surf_headMid', mo=True)
        cmds.scaleConstraint('ctrl_major_C_headMid', 'grp_surf_headMid', mo=True)

        cmds.parentConstraint('ctrl_major_C_headBtm', 'grp_surf_headBtm', mo=True)
        cmds.scaleConstraint('ctrl_major_C_headBtm', 'grp_surf_headBtm', mo=True)

        # Remove the head surfaces from the AST_FaceEDC
        cmds.container('AST_FaceEDC', edit=True, rn='World_grp_FAC_EDC', f=True, iha=True, ihb=True, inc=True)

        #cmds.delete('AST_FaceEDC')

        try:
            cmds.container('FACEDC_C_01_RIG', edit=True, an='PartLink_C_01_FACEDC', f=True, iha=True, ihb=True,
                           inc=True)
            cmds.container('FACEDC_C_01_RIG', edit=True, an='World_C_01_EDC_FACE', f=True, ihb=True, inc=True)
        except:
            pass
        try:
            cmds.container('FACEDC_C_01_RIG', edit=True, an='World_grp_FAC_EDC', f=True, iha=True, ihb=True,
                           inc=True)
        except:
            pass

        exbnlist = ['rigj_C_headMid', 'rigj_L_nose', 'rigj_R_nose', 'rigj_C_nose', 'rigj_C_headBtm',
                    'rigj_C_muzzle', 'rigj_C_jaw', 'rigj_C_headTop', 'rigj_L_eye', 'rigj_R_eye',
                    'rigj_L_eyeRoot', 'rigj_R_eyeRoot']
        for x in exbnlist:
            rigjnts.append(x)

        for jnt in rigjnts:
            # Optional game joint creation
            cmds.select(d=True)
            try:
                pos = cmds.xform(jnt, q=True, ws=True, t=True)
                rot = cmds.xform(jnt, q=True, ws=True, ro=True)
                jntname = jnt.replace('rigj', 'Bone')
                if cmds.objExists('jntname') == False:
                    bone = cmds.joint(n=jntname)
                    cmds.xform(bone, ws=True, t=pos)
                    cmds.xform(bone, ws=True, ro=rot)
                    cmds.parentConstraint(jnt, bone, mo=True)
                    cmds.scaleConstraint(jnt, bone, mo=True)
            except:
                pass
            try:
                self.loadBlendSettings()
            except:
                pass

    def collectControlShapes(self, plnodes, *args):
        filename = os.environ["AR_DATA"] + 'tools/face_rigger/prolocatorlist.json'
        data = utils.readJson(filename)
        info = json.loads(data)
        self.prolocattrlist = info['prolocattrs']

        shapeattrdict = {}

        for node in plnodes:
            allattrlst = []
            for attr in self.prolocattrlist:
                try:
                    attrval = cmds.getAttr(node + '.' + attr)
                except: pass
                if 'attrval' in locals():
                    allattrlst.append([attr, attrval])
                else:
                    allattrlst.append([attr, 'None'])
            shapeattrdict[node] = allattrlst

        return shapeattrdict

    def loadControlShapes(self, info, *args):
        for key, value in info.iteritems():
            for item in value:
                try:
                    cmds.setAttr(key+".editMode", 1)
                except: pass
                try:
                    ctrl = key.replace('_mr_', '_major_')
                    cmds.setAttr(ctrl+"."+item[0], item[1])
                    cmds.setAttr(ctrl+".editMode", 1)
                except: pass

    def loadBlendSettings(self, *args):
        data = utils.readJson(os.environ["AR_DATA"] + '/tools/face_rigger/face_blend_data_001.json')
        info = json.loads(data)

        for key, value in info.iteritems():
            for each in info[key]:
                try:
                    cmds.setAttr(each[0], each[1])
                except:pass

    def writeBlendSettings(self, *args):
        cmds.select('ctrl_major*')

        sel = cmds.ls(sl=True)
        attr_dict={}
        for s in sel:
            attrlist = []
            cattrs = cmds.listAttr(s, ud=True)
            if cattrs != None:
                for c in cattrs:
                    val = cmds.getAttr(s + '.' + c)
                    attrlist.append([s + '.' + c, val])

            attr_dict[s]=attrlist

        utils.writeJson(os.environ["AR_DATA"] + '/tools/face_rigger/face_blend_data_001.json', attr_dict)

    def lockControls(self, *args):
        # Load lock attrs for face controls.
        data = utils.readJson(os.environ["AR_DATA"] + '/tools/face_rigger/face_lockattrs.json')
        info = json.loads(data)

        for s in info['lockattrs']:
            try:
                cmds.setAttr(s[0] + '.' + s[1], l=True, cb=False, k=False)
            except: pass

    def loadLimits(self, *args):
        # Load limits
        data = utils.readJson(os.environ["AR_DATA"] + '/tools/face_rigger/face_limitattrs.json')
        info = json.loads(data)

        for key, value in info.iteritems():
            if cmds.objExists(key) == True:
                cmds.transformLimits(key, etx=(True, True), tx=(info[key][0][0], info[key][0][1]))
                cmds.transformLimits(key, ety=(True, True), ty=(info[key][1][0], info[key][1][1]))
                cmds.transformLimits(key, etz=(True, True), tz=(info[key][2][0], info[key][2][1]))

                cmds.transformLimits(key, erx=(True, True), rx=(info[key][3][0], info[key][3][1]))
                cmds.transformLimits(key, ery=(True, True), ry=(info[key][4][0], info[key][4][1]))
                cmds.transformLimits(key, erz=(True, True), rz=(info[key][5][0], info[key][5][1]))

                cmds.transformLimits(key, esx=(True, True), sx=(info[key][6][0], info[key][6][1]))
                cmds.transformLimits(key, esy=(True, True), sy=(info[key][7][0], info[key][7][1]))
                cmds.transformLimits(key, esz=(True, True), sz=(info[key][8][0], info[key][8][1]))

"""
import maya.cmds as cmds
import json
import rigging.utils.utils_json as uj
import rigging.system.face_rigger as facrig
import pymel.core as pm
reload(facrig)


sel = cmds.ls(sl=True)
for i in range(len(sel)):
    mainctrl = sel[0]
    surf = sel[1]
    if i > 1:
        name = sel[i].replace('lyt_ctrl', 'folicle')
        attrname = sel[i].replace('lyt_ctrl', '')
        cmds.addAttr(mainctrl, shortName=attrname+'_x', longName=attrname+'_x', defaultValue=.5, k=True)
        cmds.addAttr(mainctrl, shortName=attrname+'_z', longName=attrname+'_z', defaultValue=.5, k=True)
        cmds.addAttr(mainctrl, shortName=attrname+'_y', longName=attrname+'_y', defaultValue=.5, k=True)
        mdiv = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdiv_'+attrname)
        cmds.connectAttr(mainctrl+'.'+attrname+'_x', '%s.input1X' % mdiv)
        cmds.connectAttr(mainctrl+'.'+attrname+'_z', '%s.input1Z' % mdiv)
        cmds.connectAttr(mainctrl+'.'+attrname+'_y', '%s.input1Y' % mdiv)
        cmds.setAttr('%s.input2X' % mdiv, .5)
        cmds.setAttr('%s.input2Z' % mdiv, .5)
        cmds.setAttr('%s.input2Y' % mdiv, .5)

        cmds.select(sel[1])
        surf = pm.ls(sl=True)[0]
        fol = create_follicle(surf, name, uPos=0.0, vPos=0.0)

        cmds.connectAttr('%s.outputX' % mdiv, '%s.parameterV' % fol[0])
        cmds.connectAttr('%s.outputZ' % mdiv, '%s.parameterU' % fol[0])
        cmds.connectAttr('%s.outputY' % mdiv, '%s.ty' % sel[i])
        print fol[1]
        cmds.setAttr('%s.inheritsTransform' % fol[1], 0)
        cmds.parent(sel[i], fol[1])
        cmds.parent(fol[1], mainctrl)
        cmds.container('AST_FaceEDC', edit=True, an=fol[1])

cmds.select('ctrl_major*')

sel = cmds.ls(sl=True)
attr_dict={}
for s in sel:
    attrlist = []
    cattrs = cmds.listAttr(s, ud=True)
    print s
    print cattrs
    if cattrs != None:
        for c in cattrs:
            val = cmds.getAttr(s + '.' + c)
            attrlist.append([s + '.' + c, val])

    attr_dict[s]=attrlist



        # Adjust the surfaces

        try:
            for each in face_data[rootname]['surfaces']:
                if cmds.objExists(each[0]) == True:
                    cmds.xform(each[0], ws=True, t=each[1])
                    cmds.xform(each[0], ws=True, ro=each[2])

            for each in face_data[mrootname]['surfaces']:
                if cmds.objExists(each[0]) == True:
                    cmds.xform(each[0], ws=True, t=each[1])
                    cmds.xform(each[0], ws=True, ro=each[2])
        except: pass
"""
"""
[['.rx', 'None', 'None'], ['vv', 'None', 'None'],['translate']]
[['None', '.ry', 'None'], ['None', '.ty', 'None'],['translate']]
[['None', '.ry', 'None'], ['None', '.ry', 'None'], ['rotate']]

[["None", ".tz", "None"], ["uv", "vv", "None"], ["translate"]]
[["None", ".tz", "None"], ["None", "vv", "None"], ["translate"]]
"""

"""


attrlist = []


import maya.cmds as cmds
sel = cmds.ls(sl=True)
for s in sel:
    a = cmds.listAttr(s, l=True)
    if a != None:
        for each in a:
            attrlist.append([s, each])


limitinfo = []
for s in sel:
    la = getLimitInfo(s)
    limitinfo.append(la)

    if '_L_' in s:
        s = s.replace('_L_', '_R_')
        la = getLimitInfo(s)
        limitinfo.append(la)

def getLimitInfo(s):

    txs =  cmds.transformLimits(s, q=True, etx=True)
    tys =  cmds.transformLimits(s, q=True, ety=True)
    tzs =  cmds.transformLimits(s, q=True, etz=True)

    rxs =  cmds.transformLimits(s, q=True, erx=True)
    rys =  cmds.transformLimits(s, q=True, ery=True)
    rzs =  cmds.transformLimits(s, q=True, erz=True)

    sxs =  cmds.transformLimits(s, q=True, esx=True)
    sys =  cmds.transformLimits(s, q=True, esy=True)
    szs =  cmds.transformLimits(s, q=True, esz=True)


    txv =  cmds.transformLimits(s, q=True, tx=True)
    tyv =  cmds.transformLimits(s, q=True, ty=True)
    tzv =  cmds.transformLimits(s, q=True, tz=True)

    rxv =  cmds.transformLimits(s, q=True, rx=True)
    ryv =  cmds.transformLimits(s, q=True, ry=True)
    rzv =  cmds.transformLimits(s, q=True, rz=True)

    sxv =  cmds.transformLimits(s, q=True, sx=True)
    syv =  cmds.transformLimits(s, q=True, sy=True)
    szv =  cmds.transformLimits(s, q=True, sz=True)

    return([s, txs, tys, tzs, rxs, rys, rzs, sxs, sys, szs, txv, tyv, tzv, rxv, ryv, rzv, sxv, syv, szv])


for s in attrlist:
    cmds.setAttr(s[0] + '.' + s[1], l=True, cb=False, k=False)
    if '_L_' in s[0]:
        nc = s[0].replace('_L_', '_R_')
        cmds.setAttr(nc + '.' + s[1], l=True, k=False, cb=False)





print limitinfo
for i in range(len(limitinfo)):
    print type(limitinfo[i][11][0])
    print (limitinfo[i][11][0], limitinfo[i][11][1])

    #cmds.transformLimits(limitinfo[i][0], etx=(True, True), tx=limitinfo[i][10])
    cmds.transformLimits(limitinfo[i][0], ety=(True, True), ty=(limitinfo[i][11][0], limitinfo[i][11][1]))
    cmds.transformLimits(limitinfo[i][0], etz=limitinfo[i][3])

    cmds.transformLimits(limitinfo[i][0], erx=limitinfo[i][4])
    cmds.transformLimits(limitinfo[i][0], ery=limitinfo[i][5])
    cmds.transformLimits(limitinfo[i][0], erz=limitinfo[i][6])

    cmds.transformLimits(limitinfo[i][0], esx=limitinfo[i][7])
    cmds.transformLimits(limitinfo[i][0], esy=limitinfo[i][8])
    cmds.transformLimits(limitinfo[i][0], esz=limitinfo[i][9])


    cmds.transformLimits(limitinfo[i][0], tx=limitinfo[i][10])
    cmds.transformLimits(limitinfo[i][0], ty=limitinfo[i][11])
    cmds.transformLimits(limitinfo[i][0], tz=limitinfo[i][12])

    cmds.transformLimits(limitinfo[i][0], rx=limitinfo[i][13])
    cmds.transformLimits(limitinfo[i][0], ry=limitinfo[i][14])
    cmds.transformLimits(limitinfo[i][0], rz=limitinfo[i][15])

    cmds.transformLimits(limitinfo[i][0], sx=limitinfo[i][16])
    cmds.transformLimits(limitinfo[i][0], sy=limitinfo[i][17])
    cmds.transformLimits(limitinfo[i][0], sz=limitinfo[i][18])
"""
"""
# Load lock attrs for face controls.
data = uj.readJson('U:/Bin/MayaFramework/plugins/rigging/data/face_lockattrs.json')
info = json.loads(data)

for s in info['lockattrs']:
    cmds.setAttr(s[0] + '.' + s[1], l=True, cb=False, k=False)
"""
"""
# Load limits
data = uj.readJson('U:/Bin/MayaFramework/plugins/rigging/data/face_limitattrs.json')
info = json.loads(data)

for key, value in info.iteritems():
    if cmds.objExists(key) == True:
        cmds.transformLimits(key, etx=(True, True), tx=(info[key][0][0], info[key][0][1]))
        cmds.transformLimits(key, ety=(True, True), ty=(info[key][1][0], info[key][1][1]))
        cmds.transformLimits(key, etz=(True, True), tz=(info[key][2][0], info[key][2][1]))

        cmds.transformLimits(key, erx=(True, True), rx=(info[key][3][0], info[key][3][1]))
        cmds.transformLimits(key, ery=(True, True), ry=(info[key][4][0], info[key][4][1]))
        cmds.transformLimits(key, erz=(True, True), rz=(info[key][5][0], info[key][5][1]))

        cmds.transformLimits(key, esx=(True, True), sx=(info[key][6][0], info[key][6][1]))
        cmds.transformLimits(key, esy=(True, True), sy=(info[key][7][0], info[key][7][1]))
        cmds.transformLimits(key, esz=(True, True), sz=(info[key][8][0], info[key][8][1]))
"""



