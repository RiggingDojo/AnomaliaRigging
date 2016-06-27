EXPECTED TYPES ARE PYMEL OBJECTS UNLESS OTHERWISE NOTED
SIMPLE EXAMPLE USE CASES FOR EACH CLASS/FUNCTION IN THE MODULE:

with MayaUndoChunkManager:
    # perform task which would otherwise create
    # lots of tasks on the maya undo stack

# select many different ctrls (shapes OR transforms)
# and move all of the shapes into the last selected object
parentXform = mergeShapes()

# create a thick-style circle ctrl
ctrl = makeThickFkCtrl(radius=1.0, name="DERP_CTRL")

# create a thick-style box ctrl
ctrl = makeThickIkCtrl(width=1.0, name="DERP_CTRL", lines=1)

# allow multiple objects to control the same FK/IK switch attribute
# ctrl: transform object which you want to be able to access the FK IK switch
# shape: the shape which actually has the attribute (if not provided, new shape is made)
switchShape = addFKIKSwitchToCtrl(ctrl, shape, name="shape_Name")

# select desired "parent space" objects first, and CTRL object last.
# adds enum attribute to ctrl object to switch between the selected objects' spaces
addOrientsToCtrl()

# make a simple nurbs surface (ribbon) for the given joints, 
# with ribbon's width along the given axis (worlspace)
surface = makeRibbon(joints, axis="x")

# create a follicle object at the given u and v parameters on given nurbs surface
foll = makeFollicle(surface, uParam=p, vParam=0.5)