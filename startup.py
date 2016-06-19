import os
import maya.cmds as cmds

print "Startup"

import ui.ui as ui
reload(ui)
ui.RDojo_UI()