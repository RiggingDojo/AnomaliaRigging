import maya.cmds as cmds
import json
import os
import system.utils as utils
reload(utils)

# We can use variables above the class level that can be read on class import
# This is also known as an attribute of a class
classname = 'Rig_Head'
lytfile = 'head.json'
numjnts = 3

class Rig_Head:
    def __init__(self, uiinfo):
        # Get our joint lists from a json file.
        data_path = os.environ["AR_DATA"] + 'data/rig/head.json'
        # Use our readJson function
        data = utils.readJson(data_path)
        # Load the json into a dictionary
        self.module_info = json.loads( data )
        
        # Make a new dictionary to store information about the arm rig.
        self.rig_info = {}

        # Here we will see if we have a selection to get new positions from.
        if len(cmds.ls(sl=True, type='joint')) == numjnts :
            self.rig_info['seljnts']=cmds.ls(sl=True, type='joint')
            positions = []
            for s in self.rig_info['seljnts']:
                positions.append(cmds.xform(s, q=True, ws=True, t=True))
            self.rig_info['positions']=positions

            # Get the joint orientations
            self.rig_info['parent'] = cmds.listRelatives(self.rig_info['seljnts'][0], p=True)[0]
            cmds.parent(self.rig_info['seljnts'][0], w=True)
            orients = []
            for j in self.rig_info['seljnts']:
                orients.append(cmds.getAttr("%s.jointOrient" % j))
            self.rig_info['orients'] = orients
            cmds.parent(self.rig_info['seljnts'][0], self.rig_info['parent'])

        else:
            self.rig_info['positions']=self.module_info['positions']

        self.instance = uiinfo[0]

        # Run rig_arm function
        self.install()

    def install(self):
        if cmds.objExists(self.module_info['rootname'][0].replace('s_', self.instance)+'_M_GRP') == True:
            return 
        # Create a master group
        self.rig_info['mastergrp'] = cmds.group(n=self.module_info['rootname'][0].replace('s_', self.instance)+'_M_GRP', em=True)
        cmds.xform(self.rig_info['mastergrp'], ws=True, t=self.rig_info['positions'][0])
        # Create a world group
        self.rig_info['worldgrp'] = cmds.group(n=self.module_info['rootname'][0].replace('s_', self.instance)+'_W_GRP', em=True)
        cmds.xform(self.rig_info['worldgrp'], ws=True, t=self.rig_info['positions'][0])
        # Create a local group
        self.rig_info['localgrp'] = cmds.group(n=self.module_info['rootname'][0].replace('s_', self.instance)+'_L_GRP', em=True)
        cmds.xform(self.rig_info['localgrp'], ws=True, t=self.rig_info['positions'][0])

        cmds.parent(self.rig_info['worldgrp'], self.rig_info['mastergrp'])
        cmds.parent(self.rig_info['localgrp'], self.rig_info['mastergrp'])

        cmds.select(d=True)

        #Try duplicate joint method
        self.rig_info['fkjnts']=utils.duplicateJoints(self.rig_info['seljnts'], self.module_info['fkjnts'], self.instance)
        cmds.parent(self.rig_info['fkjnts'][0], self.rig_info['localgrp'])

        self.rig_info['rigjnts']=utils.duplicateJoints(self.rig_info['seljnts'], self.module_info['rigjnts'], self.instance)
        cmds.parent(self.rig_info['rigjnts'][0], self.rig_info['localgrp'])

        # Connect Ik and Fk to Rig joints
        #switchattr = self.rig_info['setcontrol'][1] + '.IK_FK'
        self.rig_info['bcnodes'] = utils.connectThroughBC(self.rig_info['fkjnts'], 'None', self.rig_info['rigjnts'], self.instance, 'None' )
        
        # Create FK rig   
        lockattrs = (['.sx', '.sy', '.sz'])
        self.rig_info['fkcontrols'] = utils.createControl([
        [self.rig_info['positions'][0], self.module_info["fkcontrols"][0].replace('s_', self.instance), 'RectangleControl.ma', lockattrs],
        [self.rig_info['positions'][1], self.module_info["fkcontrols"][1].replace('s_', self.instance), 'RectangleControl.ma', lockattrs]])

        # Orient the fk controls to the fk joints
        for i in range(len(self.rig_info['fkcontrols'])):
            tc =  cmds.parentConstraint(self.rig_info['fkjnts'][i], self.rig_info['fkcontrols'][i][0], mo=False)
            cmds.delete(tc)
        
        # Parent fk controls      
        cmds.parent(self.rig_info['fkcontrols'][1][2], self.rig_info['fkcontrols'][0][1])
      
        # Constrain fk joints to controls.
        [cmds.parentConstraint(self.rig_info['fkcontrols'][i][1], self.rig_info['fkjnts'][i], mo=True) for i in range(len(self.rig_info['fkcontrols']))]

        # Setup a head space switch
        tgrp = cmds.group(n=self.instance + 'head_TERMGRP', em=True)
        tc =  cmds.parentConstraint(self.rig_info['fkjnts'][0], tgrp, mo=False)
        cmds.delete(tc)

        cmds.parent(self.rig_info['fkcontrols'][0][2], tgrp)
        cmds.parent(tgrp, self.rig_info['localgrp'])

        tloc = cmds.spaceLocator(n=self.instance + 'head_TERMLOC')
        tc =  cmds.parentConstraint(self.rig_info['fkjnts'][0], tloc, mo=False)
        cmds.delete(tc)

        ocon = cmds.orientConstraint(tloc, tgrp, mo=True)

        cmds.addAttr(self.rig_info['fkcontrols'][0][1], shortName='World', longName='World', defaultValue=0, min=0, max=1, k=True)
        cmds.connectAttr(self.rig_info['fkcontrols'][0][1]+'.World', ocon[0] + '.C_head_TERMLOCW0')