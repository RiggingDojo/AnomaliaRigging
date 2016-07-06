import maya.cmds as cmds
import json
import pymel.core as pm


class Face_Rigger:

    def ui(self, *args):
        self.UIElements = {}

        self.windowName = "VV_FaceRigger"
        if cmds.window(self.windowName, exists=True):
            cmds.deleteUI(self.windowName)
        """ Define UI elements width and height """
        self.windowWidth = 212
        self.windowHeight = 120

        self.buttonWidth = 110
        self.buttonHeight = 30

        self.UIElements["window"] = cmds.window(self.windowName, width=self.windowWidth, height=self.windowHeight,
                                    title="VV_FaceRigger", tlb=True, sizeable=True, mxb=False, mnb=False)

        self.UIElements["rowAFlowLayout"] = cmds.flowLayout(v=True, width=self.windowWidth, height=self.windowHeight, bgc=[0.3, 0.3, 0.3], p=self.UIElements["window"])

        mstrddlst = [["None", ".tz", "None"], ["uv", "vv", "None"]]
        chldddlst = [["uv", "vv", "None"]]
        
        self.UIElements['rootname_textfield'] = cmds.textField(width=self.windowWidth, text="name")
        self.UIElements['chval_textfield'] = cmds.textField(width=self.windowWidth)
        annotation = " Create a follicle setup on the selected surface"
        self.UIElements["folctrlbutton"] = cmds.button(label='Create Follicle Setup', p=self.UIElements["rowAFlowLayout"],
                                           w=self.buttonWidth,  bgc=[0.3, 0.3, 0.3], ann=annotation, c=self.createFollicleCtrlSetup)

        annotation = " Attach a follicle setup to a main control"
        self.UIElements["ctrlattachbutton"] = cmds.button(label='Attach Setup To Main', p=self.UIElements["rowAFlowLayout"],
                                           w=self.buttonWidth,  bgc=[0.3, 0.3, 0.3], ann=annotation, c=self.connectMajorToMinor)

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

        ctrl = cmds.circle(n='ctrl_%s' % rootname)
        #ctrlshape = cmds.createNode('circle', n='ctrl_%s' % rootname +'Shape')
        #ctrlsp = cmds.listRelatives(ctrlshape, p=True)[0]
        #ctrlname = 'ctrl_%s' % rootname
        #cmds.rename(ctrl, ctrlname)

        cmds.parent(jnt, ctrl)
        cmds.parent(ctrl, lctrsdk)
        cmds.parent(lctrsdk, lctroffsetscale)
        cmds.parent(lctroffsetscale, lctroffsetrot)
        cmds.parent(lctroffsetrot, lctroffsettrans)
        cmds.parent(lctroffsettrans, lctroffset)
        cmds.parent(lctroffset, grp)
        cmds.parent(grp, fol[1])

        cmds.xform(grp, ws=True, t=folpos)

        cmds.connectAttr('%s.output3D.output3Dx' % pma, '%s.parameterV' % fol[0] )
        cmds.connectAttr('%s.output3D.output3Dy' % pma, '%s.parameterU' % fol[0] )

        if orient != 'None':
            #cmds.xform(grp, ws=True, ro=orient)
            tmpcon = cmds.parentConstraint(orient, grp, mo=False)
            cmds.delete(tmpcon)

        return([pma, locs, grp, jnt, ctrl])

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
        else:
            print chvals

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

