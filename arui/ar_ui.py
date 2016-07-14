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
            if '.pyc' not in mod or 'init' not in mod:
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

        self.UIElements["window"] = cmds.window(windowName, width=windowWidth, height=windowHeight, title="RDojo_UI", sizeable=True)

        self.UIElements["mainColLayout"] = cmds.columnLayout( adjustableColumn=True )
        self.UIElements["guiFrameLayout1"] = cmds.frameLayout( label='rigging', borderStyle='in', p=self.UIElements["mainColLayout"] )
        self.UIElements["guiFlowLayout1"] = cmds.flowLayout(v=False, width=windowWidth, height=windowHeight/2, wr=False, bgc=[0.2, 0.2, 0.2], p=self.UIElements["guiFrameLayout1"])
        
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

        """ Show the window"""
        cmds.showWindow(windowName)
      
    def rigmod(self, modfile, *args):
        """__import__ basically opens a module and reads some info from it 
            without actually loading the module in memory."""
        mod = __import__("rig."+modfile, {}, {}, [modfile])
        reload(mod)
        print "The mod"
        print mod

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