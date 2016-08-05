

"""
Code used to create the switches on the arms and legs.
You can edit or add a new list to make switches
on a control
"""
def createArmSwitches(pairs, instance):
    parents = []
    enumvals = []
    connodes = []
    for p in range(len(pairs)):
        parents.append(pairs[p][0])
        con = cmds.shadingNode("condition", asUtility=True, n=instance + pairs[p][0] + 'Switch_CON')
        connodes.append(con)
        cmds.setAttr(con+'.secondTerm', p)
        enumvals.append(pairs[p][2])
        
    
    ctrlparent = cmds.listRelatives(pairs[0][1], p=True)[0]
    switchgrpname = pairs[0][1].replace('_GRP', '_SWITCH' )
    sgrp = cmds.group(n=switchgrpname, em=True)
    tc = cmds.parentConstraint(pairs[0][1], sgrp, mo=False)
    cmds.delete(tc)
    cmds.parent(sgrp, ctrlparent)
    cmds.parent(pairs[0][1], sgrp)
    parentcon = cmds.parentConstraint(parents[0], parents[1], sgrp, mo=True)
    cmds.addAttr(pairs[p][2], at='enum', en="World:Root", shortName="switch", longName="switch", k=True)
    
    for c in range(len(connodes)):    
        cmds.setAttr(connodes[c]+'.colorIfTrueR', 1) 
        cmds.setAttr(connodes[c]+'.colorIfTrueG', 1) 
        cmds.setAttr(connodes[c]+'.colorIfTrueB', 1) 
        cmds.setAttr(connodes[c]+'.colorIfFalseR', 0)
        cmds.setAttr(connodes[c]+'.colorIfFalseG', 0)
        cmds.setAttr(connodes[c]+'.colorIfFalseB', 0)
        cmds.connectAttr(pairs[0][2]+'.switch', connodes[c]+'.firstTerm')
        cmds.connectAttr(connodes[c]+'.outColorR', parentcon[0] + '.' + pairs[c][0] + 'W' + str(c))
        
createArmSwitches(pairs, 'L_01_')
        
pairs = [['world_CTRL', 'L_arm_IK_CTRL_GRP', 'L_arm_SETTINGS_CTRL', 'World']
, ['root_CTRL', 'L_arm_IK_CTRL_GRP', 'L_arm_SETTINGS_CTRL', 'Root']
, ['cog_CTRL', 'L_arm_IK_CTRL_GRP', 'L_arm_SETTINGS_CTRL', 'COG']
, ['C_spine_pelvis_CTRL', 'L_arm_IK_CTRL_GRP', 'L_arm_SETTINGS_CTRL', 'Pelvis' ]
, ['C_spine_chest_CTRL', 'L_arm_IK_CTRL_GRP', 'L_arm_SETTINGS_CTRL', 'Chest'] ]

pairs = [['world_CTRL', 'R_arm_IK_CTRL_GRP', 'R_arm_SETTINGS_CTRL', 'World']
, ['root_CTRL', 'R_arm_IK_CTRL_GRP', 'R_arm_SETTINGS_CTRL', 'Root']
, ['cog_CTRL', 'R_arm_IK_CTRL_GRP', 'R_arm_SETTINGS_CTRL', 'COG']
, ['C_spine_pelvis_CTRL', 'R_arm_IK_CTRL_GRP', 'R_arm_SETTINGS_CTRL', 'Pelvis' ]
, ['C_spine_chest_CTRL', 'R_arm_IK_CTRL_GRP', 'R_arm_SETTINGS_CTRL', 'Chest']]


pairs = [['world_CTRL', 'L_leg_IK_CTRL_GRP', 'L_leg_SETTINGS_CTRL', 'World']
, ['root_CTRL', 'L_leg_IK_CTRL_GRP', 'L_leg_SETTINGS_CTRL', 'Root']]

pairs = [['world_CTRL', 'R_leg_IK_CTRL_GRP', 'R_leg_SETTINGS_CTRL', 'World']
, ['root_CTRL', 'R_leg_IK_CTRL_GRP', 'R_leg_SETTINGS_CTRL', 'Root']]

pairs = [['world_CTRL', 'R_leg_PV_CTRL_GRP', 'R_leg_PV_CTRL', 'World']
, ['root_CTRL', 'R_leg_PV_CTRL_GRP', 'R_leg_PV_CTRL', 'Root']
, ['R_leg_IK_CTRL', 'R_leg_PV_CTRL_GRP', 'R_leg_PV_CTRL', 'LEG']]

pairs = [['world_CTRL', 'L_leg_PV_CTRL_GRP', 'L_leg_PV_CTRL', 'World']
, ['root_CTRL', 'L_leg_PV_CTRL_GRP', 'L_leg_PV_CTRL', 'Root']
, ['L_leg_IK_CTRL', 'L_leg_PV_CTRL_GRP', 'L_leg_PV_CTRL', 'Leg']]
"""
Duplicate the game skeleton to make motion capture joints.
"""
sel = cmds.ls(sl=True, type='joint')
jntlist = []

for s in sel:
    if 'END' not in s:
        jntlist.append(s)
        
for j in jntlist:
    newname = j.replace('_JNT', '_MOCAP')
    parcon = cmds.listConnections(j, t='parentConstraint')
    if parcon != None:
        cmds.delete(parcon[0])
    cmds.rename(j, newname)



""" 
Attach mocap to controls
"""
"""
Create a mocap skeleton and try to attach
controls to it
"""
bindjnts = []
cmds.select('C_root_JNT', hi=True)
sel = cmds.ls(sl=True, type='joint')
cmds.select(d=True)
for s in sel: 
    if "_JNT" in s:
        bindjnts.append(s)
 
jntinfo = []
for j in bindjnts:
    mcname=j.replace('_JNT', '_MOCAP')
    par = cmds.listRelatives(j, p=True)
    if par != None:
        mjpar = par[0].replace('_JNT', '_MOCAP')
    if par != None:
        jntinfo.append([j, mcname, mjpar])
    else:
        jntinfo.append([j, mcname, 'NONE'])
 
for each in jntinfo:
    print each 
    if cmds.objExists(each[1]):
        cmds.delete(each[1]) 
    try:  
        cmds.duplicate(each[0], po=True, n=each[1])
        cmds.select(d=True)
    except: pass
for each in jntinfo:
    print each
    if each != 'NONE':
        try:
            cmds.parent(each[1], each[2])
        except: pass
        
mocappairs = [['R_wrist_MOCAP', 'R_arm_IK_CTRL_MOCAP'], ['R_elbow_MOCAP', 'R_arm_PV_CTRL_MOCAP'],
['R_wrist_MOCAP', 'R_wrist_FK_CTRL'], ['R_elbow_MOCAP', 'R_elbow_FK_CTRL'], ['R_shoulder_MOCAP', 'R_shoulder_FK_CTRL'],
['L_wrist_MOCAP', 'L_arm_IK_CTRL_MOCAP'], ['L_elbow_MOCAP', 'L_arm_PV_CTRL_MOCAP'],
['L_wrist_MOCAP', 'L_wrist_FK_CTRL_MOCAP'], ['L_elbow_MOCAP', 'L_elbow_FK_CTRL_MOCAP'], ['L_shoulder_MOCAP', 'L_shoulder_FK_CTRL_MOCAP'],
['L_ankle_MOCAP', 'L_leg_IK_CTRL_MOCAP'], ['L_knee_MOCAP', 'L_leg_PV_CTRL_MOCAP'],
['L_ankle_MOCAP', 'L_ankle_FK_MOCAP'], ['L_knee_MOCAP', 'L_knee_FK_MOCAP'], ['L_hip_MOCAP', 'L_hip_FK_CTRL_MOCAP'],
['R_ankle_MOCAP', 'R_leg_IK_CTRL_MOCAP'], ['R_knee_MOCAP', 'R_leg_PV_CTRL_MOCAP'],
['R_ankle_MOCAP', 'R_ankle_FK_CTRL_MOCAP'], ['R_knee_MOCAP', 'R_knee_FK_CTRL_MOCAP'], ['R_hip_MOCAP', 'R_hip_FK_CTRL_MOCAP'],
['C_pelvis_MOCAP', 'C_pelvis_01_CTRL_MOCAP'], ['C_spine_01_MOCAP', 'C_belly_01_CTRL_MOCAP'], ['C_spine_02_MOCAP', 'C_belly_01_CTRL_MOCAP'],
['C_spine_03_MOCAP', 'C_spine_chest_CTRL_MOCAP'], ['C_neck_MOCAP', 'C_neck_FK_CTRL_MOCAP'], ['C_head_MOCAP', 'C_head_FK_CTRL_MOCAP']]

for each in mocappairs:
    print each
    pconname = each[1] + '_parentConstraint'
    if cmds.objExists(each[1]) == True and cmds.objExists(each[0]) == True:
        #if cmds.listConnections(each[1], type='parentConstraint')==[]:
        cmds.parentConstraint(each[0], each[1], n=pconname, mo=True)
    else: print each



"""
Make finger RIGJNTS
"""
#Make finger RIGJNTS

sel = cmds.ls(sl=True)
fingersets = []
for s in sel:
    rjname = s.replace('FK_CTRL', 'RIGJNT')
    cmds.select(d=True)
    rj = cmds.joint(n=rjname)
    tmpcon = cmds.parentConstraint(s, rj, mo=False)
    cmds.delete(tmpcon)
    cmds.parent(rj, s)
    cmds.makeIdentity(rj, apply=True)
    sdkgrp = s.replace('FK_CTRL', 'SDK')
    mdiv = cmds.shadingNode("multiplyDivide", asUtility=True, n=sdkgrp + 'BCNODE')
    cmds.connectAttr(mdiv + '.output', sdkgrp + '.rotate')
    fingersets.append([s, rj, sdkgrp, mdiv])

"""
Select and delete locked unknown nodes
"""
node = cmds.ls(type='unknown')
cmds.select(node)
cmds.lockNode(node[0], l=False, ic=True)
cmds.delete(node[0])



""" 
Connect JNT to RIGJ
"""
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


"""
Connect joints through blend colors
"""
ikjnts = cmds.ls(sl=True)
fkjnts = cmds.ls(sl=True)
rigjnts = cmds.ls(sl=True)
import system.utils as utils
switchattr = 'L_leg_SETTINGS_CTRL.Ik_Fk'
instance = 'L_leg_'
utils.connectThroughBC(ikjnts, fkjnts, rigjnts, instance, switchattr )


"""
Create finger attributes
"""
attrlist = ("Index_Curl", "Middle_Curl", "Ring_Curl", "Pinky_Curl", "Thumb_Curl")
cmds.addAttr("R_arm_SETTINGS_CTRL", ln="Curl", enumName="........", at='enum', h=False, keyable=True)
for a in attrlist:
    cmds.addAttr("R_arm_SETTINGS_CTRL", ln=a, at='float', min=-300, max=300, h=False, keyable=True)
    
attrlist = ("Index_Twist", "Middle_Twist", "Ring_Twist", "Pinky_Twist", "Thumb_Twist")
cmds.addAttr("R_arm_SETTINGS_CTRL", ln="Twist", enumName="........", at='enum', h=False, keyable=True)
for a in attrlist:
    cmds.addAttr("R_arm_SETTINGS_CTRL", ln=a, at='float', min=-300, max=300, h=False, keyable=True)

cmds.addAttr("R_arm_SETTINGS_CTRL", ln="Finger_Spread", enumName="........", at='enum', h=False, keyable=True)

cmds.addAttr("R_arm_SETTINGS_CTRL", ln="Spread", at='float', min=-300, max=300, h=False, keyable=True)

cmds.addAttr("R_arm_SETTINGS_CTRL", ln="Finger_Cup", enumName="........", at='enum', h=False, keyable=True)

cmds.addAttr("R_arm_SETTINGS_CTRL", ln="Cup", at='float', min=-300, max=300, h=False, keyable=True)



"""
Swap proLocators
"""
# Swap pro locators

pl = cmds.ls(type='proLocator')

for p in pl:
    cname = p.replace('Shape', 'tmp')
    trans = cmds.listRelatives(p, p=True)
    cir = cmds.circle(n=cname, r=.2, nr=[1.0, 0.0, 0.0])
    tmpcon = cmds.parentConstraint(trans, cir, mo=False)
    cmds.delete(tmpcon)
    cmds.delete(p)
    shp = cname + 'Shape'
    cmds.parent(shp, trans, s=True, r=True)