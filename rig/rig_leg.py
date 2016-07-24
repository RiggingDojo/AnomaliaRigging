import maya.cmds as cmds
import json
import os
import system.utils as utils
reload(utils)

# We can use variables above the class level that can be read on class import
# This is also known as an attribute of a class
classname = 'Rig_Leg'
lytfile = 'leg.json'
numjnts = 4

class Rig_Leg:
    def __init__(self, uiinfo):
        # Get our joint lists from a json file.
        data_path = os.environ["AR_DATA"] + 'data/rig/leg.json'
        # Use our readJson function
        data = utils.readJson(data_path)
        # Load the json into a dictionary
        self.module_info = json.loads( data )
        
        # Make a new dictionary to store information about the rig.
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
        self.rig_info['ikjnts']=utils.duplicateJoints(self.rig_info['seljnts'], self.module_info['ikjnts'], self.instance)
        cmds.parent(self.rig_info['ikjnts'][0], self.rig_info['localgrp'])

        self.rig_info['fkjnts']=utils.duplicateJoints(self.rig_info['seljnts'], self.module_info['fkjnts'], self.instance)
        cmds.parent(self.rig_info['fkjnts'][0], self.rig_info['localgrp'])

        self.rig_info['rigjnts']=utils.duplicateJoints(self.rig_info['seljnts'], self.module_info['rigjnts'], self.instance)
        cmds.parent(self.rig_info['rigjnts'][0], self.rig_info['localgrp'])
        
        # Make a control for arm settings
        lockattrs = (['.tx', '.ty', '.tz', '.rx', '.ry', '.rz', '.sx', '.sy', '.sz'])
        setctrlname = self.module_info["settingscontrol"][0].replace('s_', self.instance)
        self.rig_info['setcontrol']=utils.createControl([[self.rig_info['positions'][2], setctrlname, 'SettingsControl.ma', lockattrs]])[0]
        cmds.addAttr(self.rig_info['setcontrol'][1], shortName='IK_FK', longName='Ik_Fk', defaultValue=1, min=0, max=1, k=True)
        cmds.addAttr(self.rig_info['setcontrol'][1], shortName='stretch', longName='Stretchy', defaultValue=0, min=0, max=1, k=True)
        cmds.addAttr(self.rig_info['setcontrol'][1], shortName='Root_Length', longName='Root_Length', defaultValue=0, min=-5, max=5, k=True)
        cmds.addAttr(self.rig_info['setcontrol'][1], shortName='End_Length', longName='End_Length', defaultValue=0, min=-5, max=5, k=True)
        cmds.parent(self.rig_info['setcontrol'][0], self.rig_info['localgrp'])

        # Connect Ik and Fk to Rig joints
        switchattr = self.rig_info['setcontrol'][1] + '.IK_FK'
        self.rig_info['bcnodes'] = utils.connectThroughBC(self.rig_info['ikjnts'], self.rig_info['fkjnts'], self.rig_info['rigjnts'], self.instance, switchattr )
        
        # Create Ik Rig
        lockattrs = (['.sx', '.sy', '.sz'])
        ikctrlname = self.module_info["ikcontrols"][0].replace('s_', self.instance)
        self.rig_info['ikcontrol']=utils.createControl([[self.rig_info['positions'][2], ikctrlname, 'FootControl.ma', lockattrs]])[0]
        cmds.parent(self.rig_info['ikcontrol'][0], self.rig_info['localgrp'])
        
        lockattrs = (['.rx', '.ry', '.rz', '.sx', '.sy', '.sz'])
        pvpos = utils.calculatePVPosition([self.rig_info['ikjnts'][0], self.rig_info['ikjnts'][1], self.rig_info['ikjnts'][2]])
        pvctrlname = self.module_info["ikcontrols"][2].replace('s_', self.instance)
        self.rig_info['pvcontrol']=utils.createControl([[[pvpos[0], pvpos[1], pvpos[2]], pvctrlname, 'PVControl.ma', lockattrs]])[0]
        tmpcon = cmds.orientConstraint(self.rig_info['ikjnts'][1], self.rig_info['pvcontrol'][0], mo=False)
        cmds.delete(tmpcon)
        cmds.select(self.rig_info['pvcontrol'][0])
        #cmds.move(-5, z=True, r=True)
        cmds.parent(self.rig_info['pvcontrol'][0], self.rig_info['localgrp'])

        # Generate a name for the ik handle using self.instance
        ikhname = self.module_info["ikcontrols"][1].replace('s_', self.instance)
        # Create Stretchy IK
        pmas = 1
        pvMA = self.instance + "PV"
        self.rig_info['ikinfo']=utils.createStretchyIk(self.rig_info['ikjnts'], self.rig_info['rigjnts'], self.rig_info['ikcontrol'], 
            ikhname, pvctrlname, self.instance, False, pmas, pvMA, '.tx', self.rig_info['setcontrol'])

        # Parent ikh to ctrl
        cmds.parent(self.rig_info['ikinfo'][0], self.rig_info['ikcontrol'][1])
        cmds.parent(self.rig_info['ikinfo'][1], self.rig_info['localgrp'])
        for each in self.rig_info['ikinfo'][2]:
            try:
                cmds.parent(each, self.rig_info['worldgrp'])
            except: pass
    
        # orient constrain ik_wrist to ctrl
        cmds.orientConstraint(self.rig_info['ikcontrol'][1], self.rig_info['ikjnts'][2], mo=True)

        # Create FK rig   
        lockattrs = (['.sx', '.sy', '.sz'])
        self.rig_info['fkcontrols'] = utils.createControl([
        [self.rig_info['positions'][0], self.module_info["fkcontrols"][0].replace('s_', self.instance), 'RectangleControl.ma', lockattrs],
        [self.rig_info['positions'][1], self.module_info["fkcontrols"][1].replace('s_', self.instance), 'RectangleControl.ma', lockattrs],
        [self.rig_info['positions'][2], self.module_info["fkcontrols"][2].replace('s_', self.instance), 'RectangleControl.ma', lockattrs]])

        # Orient the fk controls to the fk joints
        for i in range(len(self.rig_info['fkcontrols'])):
            tc =  cmds.parentConstraint(self.rig_info['fkjnts'][i], self.rig_info['fkcontrols'][i][0], mo=False)
            cmds.delete(tc)
        # Parent fk controls      
        cmds.parent(self.rig_info['fkcontrols'][2][0], self.rig_info['fkcontrols'][1][1])
        cmds.parent(self.rig_info['fkcontrols'][1][0], self.rig_info['fkcontrols'][0][1])
        cmds.parent(self.rig_info['fkcontrols'][0][0], self.rig_info['localgrp'])
      
        # Constrain fk joints to controls.
        [cmds.parentConstraint(self.rig_info['fkcontrols'][i][1], self.rig_info['fkjnts'][i], mo=True) for i in range(len(self.rig_info['fkcontrols']))]
