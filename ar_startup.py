import os
import maya.cmds as cmds

print "Startup"

import arui.ar_ui as ar_ui
reload(ar_ui)
ar_ui.AR_UI()