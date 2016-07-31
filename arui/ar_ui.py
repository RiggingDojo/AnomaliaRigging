import maya.cmds as cmds
import os
from functools import partial
import system.utils as utils
reload(utils)

# The UI class
class AR_UI:

    def __init__(self, *args):
        print 'In AR_UI'
        mi = cmds.window('MayaWindow', ma=True, q=True)
        for m in mi:
            if m == 'RDojo_Menu':
                cmds.deleteUI('RDojo_Menu', m=True)

        mymenu = cmds.menu('AR_Menu', label='ARMenu', to=True, p='MayaWindow')
        cmds.menuItem(label='Rig Tool', parent=mymenu, command=self.ui)

        """ Create a dictionary to store UI elements.
        This will allow us to access these elements later. """
        self.UIElements = {}

        # This dictionary will store all of the available rigging modules.
        self.rigmodlst = []
        rigcontents = os.listdir(os.environ["AR_DATA"]+ 'rig/')
        for mod in rigcontents:
            if '.pyc' not in mod:
                self.rigmodlst.append(mod)
        # An empty list to store information collected from the ui.
        self.uiinfo = [] 

    def ui(self, *args):
        """ Check to see if the UI exists """
        windowName = "Window"
        if cmds.window(windowName, exists=True):
            cmds.deleteUI(windowName)
        """ Define width and height for buttons and windows"""    
        windowWidth = 240
        windowHeight = 120
        buttonWidth = 55
        buttonHeight = 22

        self.UIElements["window"] = cmds.window(windowName, width=windowWidth, height=windowHeight, title="RDojo_UI", sizeable=True, menuBar=True)

        self.UIElements["mainColLayout"] = cmds.columnLayout( adjustableColumn=True )
        self.UIElements["guiFrameLayout1"] = cmds.frameLayout( label='rigging', borderStyle='in', p=self.UIElements["mainColLayout"] )
        self.UIElements["guiFlowLayout1"] = cmds.flowLayout(v=False, width=windowWidth, height=windowHeight/2, wr=False, bgc=[0.2, 0.2, 0.2], p=self.UIElements["guiFrameLayout1"])
        
        """ Make a menu bar """
        self.UIElements['menu'] = cmds.menu(label='Utils', tearOff=True)

        cmds.menuItem(label='Color Picker', c=self.openColorPalette)
        cmds.menuItem(label='Connect Skeleton', c=self.openColorPalette)
        cmds.menuItem(label='Space Switch', c=self.spaceSwitchUi)

        cmds.separator(w=10, hr=True, st='none', p=self.UIElements["guiFlowLayout1"])
        self.UIElements["rigMenu"] = cmds.optionMenu('Rig_Install', label='Rig', p= self.UIElements["guiFlowLayout1"]) 
        
        # Dynamically make a menu item for each rigging module.
        for mod in self.rigmodlst:
            itemname = mod.replace('.py', '')    
            cmds.menuItem(label=itemname, p=self.UIElements["rigMenu"], c=partial(self.rigmod, itemname))

        cmds.separator(w=10, hr=True, st='none', p=self.UIElements["guiFlowLayout1"])
        # Make a menu for left, right and center sides.
        # We will query the value later.
        sides = ['L_', 'R_', 'C_']
        self.UIElements["sideMenu"] = cmds.optionMenu('Side', label='side', p=self.UIElements["guiFlowLayout1"]) 
        for s in sides:
            cmds.menuItem(label=s, p=self.UIElements["sideMenu"])    

        # Make a button to run the rig script
        modfile = cmds.optionMenu(self.UIElements["rigMenu"], q=True, v=True) 
        cmds.separator(w=10, hr=True, st='none', p=self.UIElements["guiFlowLayout1"])
        self.UIElements["rigbutton"] = cmds.button(label="Rig", width=buttonWidth, height=buttonHeight, bgc=[0.2, 0.4, 0.2], p=self.UIElements["guiFlowLayout1"], c=partial(self.rigmod, modfile))

        cmds.separator(w=10, hr=True, st='none', p=self.UIElements["guiFlowLayout1"])
        self.UIElements["facebutton"] = cmds.button(label="Face", width=buttonWidth, height=buttonHeight, bgc=[0.2, 0.4, 0.2], p=self.UIElements["guiFlowLayout1"], c=self.loadFaceTools)

        # BK:
        # create new row (flowLayout) for miscellaneous rigging tools,
        # ie ones that need more user input than a single optionMenu of L_, R_, C_
        self.UIElements["miscButtonLayout"] = cmds.flowLayout(v=False, width=windowWidth, height=windowHeight/4, 
                                                    bgc=[0.2, 0.2, 0.2], p=self.UIElements["guiFrameLayout1"],
                                                    wr=False, columnSpacing=8)
        self.UIElements["miscLabel"] = cmds.text("Other Rigs: ", p=self.UIElements["miscButtonLayout"])
        # spline button
        self.UIElements["spinebutton"] = cmds.button(label="Spine", width=buttonWidth, height=buttonHeight,
                                                    bgc=[0.2, 0.4, 0.2], p=self.UIElements["miscButtonLayout"], 
                                                    c=self.loadSplineTool)
        # Foot button
        self.UIElements["footbutton"] = cmds.button(label="foot", width=buttonWidth, height=buttonHeight,
                                                    bgc=[0.2, 0.4, 0.2], p=self.UIElements["miscButtonLayout"], 
                                                    c=self.loadFootTool)

        # Face button
        self.UIElements["facebutton"] = cmds.button(label="face", width=buttonWidth, height=buttonHeight,
                                                    bgc=[0.2, 0.4, 0.2], p=self.UIElements["miscButtonLayout"], 
                                                    c=self.loadFaceTool)

        """ Show the window"""
        cmds.showWindow(windowName)
      
    def rigmod(self, modfile, *args):
        """__import__ basically opens a module and reads some info from it 
            without actually loading the module in memory."""
        currentValue = cmds.optionMenu(self.UIElements["rigMenu"], query=True, value=True)
        mod = __import__("rig."+currentValue, {}, {}, [currentValue])
        reload(mod)
        
        self.uiinfo[:] = []
        sideval = cmds.optionMenu(self.UIElements["sideMenu"], q=True, v=True) 
        self.uiinfo.append([sideval, modfile]) 
        # getattr will get an attribute from a class
        moduleClass = getattr(mod, mod.classname)
        moduleInstance = moduleClass(self.uiinfo[0])

    def loadFaceTools(self, *args):
        import tools.face_rigger as fg
        reload(fg)
        face = fg.Face_Rigger()
        face.ui()

    # BK:
    def loadSplineTool(self, *args):
        """create a spline rigging wizard window"""
        from tools import bkStretchySpline as spl
        reload(spl)
        wizard = spl.makeGuiWindow()
        return wizard

    def loadFootTool(self, *args):
        """create a foot rigging window"""
        from tools.foot_rigger import griff_footRig as gfr
        reload(gfr)
        gfr = gfr.GR_FootRig()
        ui = gfr.ui()

    def loadFaceTool(self, *args):
        import tools.face_rigger.face_rigger as fr
        reload(fr)
        fr = fr.Face_Rigger()
        fr.ui()

    @staticmethod
    def openColorPalette(_):
        import maya.mel as mel
        mel.eval("objectColorPalette ();")

    def connectSkeleton(_):
        if cmds.ls(sl=True) == []:
            return cmds.headsUpMessage("Select the joints you want to connect")
        sel = cmds.ls(sl=True, type='joint')
        failcon = []
        for s in sel:
            rjname = s.replace('_JNT', '_RIGJNT')
            try:
                cmds.parentConstraint(rjname, s, mo=True)
                print rjname
                print s
                print "Success"
            except:
                failcon.append(s)
                
        print failcon

    def spaceSwitchUi(self, *args):
        """ Check to see if the UI exists """
        windowName = "SpaceSwitch"
        if cmds.window(windowName, exists=True):
            cmds.deleteUI(windowName)
        """ Define width and height for buttons and windows"""    
        windowWidth = 130
        windowHeight = 300
        buttonWidth = 128
        buttonHeight = 22

        self.UIElements["window"] = cmds.window(windowName, width=windowWidth, height=windowHeight, title="Space Switch", sizeable=True)

        self.UIElements["guiFrameLayout1"] = cmds.columnLayout( adjustableColumn=True )
        self.UIElements["guiFlowLayout1"] = cmds.flowLayout(v=True, width=windowWidth, height=windowHeight/2, wr=False, bgc=[0.2, 0.2, 0.2], p=self.UIElements["guiFrameLayout1"])
 
        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        self.UIElements["selparent"] = cmds.button(label="select the parent", width=buttonWidth, height=buttonHeight, bgc=[0.4, 0.2, 0.2], 
            p=self.UIElements["guiFlowLayout1"], c=partial(self.selBtnCallback, "selparent"))

        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        self.UIElements["selchild"] = cmds.button(label="select the child", width=buttonWidth, height=buttonHeight, bgc=[0.4, 0.2, 0.2], 
            p=self.UIElements["guiFlowLayout1"], c=partial(self.selBtnCallback, "selchild"))

        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        self.UIElements["selattr"] = cmds.button(label="select control for ss attr", width=buttonWidth, height=buttonHeight, bgc=[0.4, 0.2, 0.2], 
            p=self.UIElements["guiFlowLayout1"], c=partial(self.selBtnCallback, "selattr"))

        cmds.separator(w=10, hr=True, p=self.UIElements["guiFlowLayout1"])
        self.UIElements["makeswitch"] = cmds.button(label="Make The Switch", width=buttonWidth, height=buttonHeight, bgc=[0.2, 0.4, 0.2], 
            p=self.UIElements["guiFlowLayout1"], c=self.createControlLink)

        """ Show the window"""
        cmds.showWindow(windowName)

    def selBtnCallback(self, ctrl, *args):
        if cmds.ls(sl=True) == []:
            return
        sel=cmds.ls(sl=True)[0]
        cmds.button(self.UIElements[ctrl], edit=True, label=sel, bgc=[0.2, 0.4, 0.2])

    def createControlLink(self, *args):
        # TODO: use part_utils version
        source = cmds.button(self.UIElements["selparent"], q=True, l=True)
        target = cmds.button(self.UIElements["selchild"], q=True, l=True)
        attrctrl = cmds.button(self.UIElements["selattr"], q=True, l=True)

        tgtGrpName = source + '_' + target + '_LINKGRP'
        sourcePos = cmds.xform(source, q=True, ws=True, t=True)

        tgtGrp = cmds.group(n=tgtGrpName, em=True)
        cmds.xform(tgtGrp, ws=True, t=sourcePos)

        targetParent = cmds.listRelatives(target, p=True)

        cmds.parent(tgtGrp, targetParent)
        cmds.makeIdentity(tgtGrp, apply=True)
        cmds.parent(target, tgtGrp)

        pcon = cmds.parentConstraint(source, tgtGrp, mo=True)

        # Try do add and connect an attribute.
        cmds.listAttr(target, k=True, ud=True)

        # Generate an attribute name
        if source.endswith('_CTRL') == True or source.endswith('_RIGJNT') == True:
            srcname = source.rpartition('_')[0]
            cmds.addAttr(attrctrl, ln=srcname, at="enum", en="off:on:", k=True)
            # Connect the attr to the parent constraint
            cmds.connectAttr(attrctrl + "." + srcname, pcon[0] + "." + source + "W0")
        else:
            cmds.addAttr(ln=source, at="enum", en="off:on:", k=True)
            # Connect the attr to the parent constraint
            cmds.connectAttr(attrctrl, target + "." + source, pcon[0] + "." + source + "W0")
