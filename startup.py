import os
import maya.cmds as cmds
import platform


print "Startup with rdui"


#Define if the user is using Mac or PC
#Set a system path to the data files. 
if platform.system() == 'Windows':
    os.environ["AR_DATA"] = 'C:/Users/arklein/Documents/GitHub/AnomaliaRigging/'
else:
    os.environ["AR_DATA"] = '/Users/arklein/Documents/GitHub/AnomaliaRigging/'



import rdui.rdui as rdui
reload(rdui)
rdui.RDojo_UI()

