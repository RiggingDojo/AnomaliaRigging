import pymel.core as pmc
import unittest

"""
A collection of utilities for building better rig controls:
- MayaUndoChunkManager
- mergeShapes
- makeThickFkCtrl
- makeThickIkCtrl
- makePinCtrl
- addFKIKSwitchToCtrl
- addOrientsToCtrl
- makeRibbon
- makeFollicle
"""

# credit to Rob Galanakis on TAO,
# this SAFELY manages the Maya undo queue so that
# any large, multi-step operation 
# is a single entry in the Maya undo queue
#
class MayaUndoChunkManager(object):
    def __enter__(self):
        pmc.undoInfo(openChunk=True)
    def __exit__(self, *args):
        pmc.undoInfo(closeChunk=True)


# DOES NOT FREEZE TRANSFORMATIONS
# XFORMS NEED TO BE EQUAL FOR PREDICTABLE RESULTS
#
def mergeShapes():
	sel = pmc.ls(selection=True, transforms=True)
	if len(sel) < 2:
		pmc.warning("Select more than one transform.")
		return
	par = sel.pop()
	for s in sel:
		parentChildShapes(s, par)
		pmc.delete(s)
	pmc.select(par)
	return par


def parentChildShapes(obj, par):
	for c in obj.getChildren():
		if c.type() == "transform":
			parentChildShapes(c, par)
		else:
			c.setParent(par, relative=True, shape=True)


# Creates a quad-circle as a ctrl, and merges it to one shape
def makeThickFkCtrl(radius=1.0, name="FK_CTRL"):
	offset = (radius*1.05) - radius
	c1 = pmc.circle(r=(radius*1.05), nr=(1, 0, 0))
	c2 = pmc.circle(r=(radius*0.95), nr=(1, 0, 0))
	c3 = pmc.circle(r=radius, nr=(1, 0, 0))
	pmc.move(offset, 0, 0)
	pmc.makeIdentity(apply=True)
	pmc.xform(c3, sp=(0, 0, 0), rp=(0, 0, 0), ws=True)
	c4 = pmc.circle(r=radius, nr=(1, 0, 0))
	pmc.move(-offset, 0, 0)
	pmc.makeIdentity(apply=True)
	pmc.xform(c4, sp=(0, 0, 0), rp=(0, 0, 0), ws=True)

	pmc.select(c4, c3, c2, c1)
	ctrl = mergeShapes()
	ctrl.rename(name)
	return ctrl


def makeThickIkCtrl(width=1.0, name="IK_CTRL", lines=1):
	if lines > 10:
		lines = 10
	shapes = []
	for i in range(lines):
		for v in [(width/2, 0, 0), (-width/2, 0, 0), (0, width/2, 0),
					(0, -width/2, 0), (0, 0, width/2), (0, 0, -width/2)]:
			sh = pmc.nurbsSquare(nr=v, c=v, sl1=width, sl2=width)[0]
			shapes.append(sh)
		# increase side length
		width *= 1.05

	g = pmc.group(empty=True, name=name)
	pmc.select(shapes, g)
	ctrl = mergeShapes()
	return ctrl


# a simple control shape which is good for controlling
# stretchy splines and the like.
#
def makePinCtrl(h=0.5, name="PIN_CTRL", axis=(0, 0, 1)):
	#v = pmc.dt.Vector(axis)
	#cone = pmc.cone(d=1, sections=4, pivot=(-h/2*axis), 
	#						ax=axis, r=h/4, hr=4)
	
	pts = ((0, 0, 0), (h/4, 0, h), (-h/4, 0, h), 
	        (0, h/4, h), (0, -h/4, h))

	curves = []
	for i in range(len(pts)):
		for n in range(i+1, len(pts)):
			ps = (pts[i], pts[n])
			c = pmc.curve(d=1, p=ps)
			curves.append(c)

	pmc.select(curves)
	ctrl = mergeShapes()
	ctrl.rename(name)
	# edit orientation
	a = pmc.angleBetween(euler=True, v1=(0, 0, 1), v2=axis)
	ctrl.rotate.set(a)
	pmc.makeIdentity(ctrl, apply=True, r=True)
	return ctrl


# Allow for multiple ctrls to access and set the
# same FK_IK_Switch attribute, on an instanced locator
#
def addFKIKSwitchToCtrl(ctrl, shape=None, name="FK_IK_Switcher"):
	if not shape:
		# create the thing if it's not passed in
		l = pmc.spaceLocator(n=name)
		shape = l.getShape()
		shape.setAttr("visibility", False)
		for a in shape.listAttr(cb=True):
		    a.set(channelBox=False)
		shape.addAttr("FK_IK_Switch", at="float", 
	               		keyable=True, min=0, max=1.0)
	new = shape.setParent(ctrl, add=True, shape=True)
	# shape is explicitly under original transform,
	# so to reorder need the lastest shape under ctrl
	ctrlShape = ctrl.getShapes()[-1]
	pmc.reorder(ctrlShape, front=True)
	
	return shape


# Add space switching to LAST selected item, using all other
# selected items as source spaces. Also adds "world" option.
#
def addOrientsToCtrl(noSnap=False):
	sel = pmc.ls(selection=True)
	# make sure selection is valid
	if len(sel) < 2:
		pmc.error("Select more shit.")
		return
	for s in sel:
		if s.type() != "transform":
			pmc.error("Invalid selection: {0}".format(s))
			return

	target = sel[-1]
	sources = sel[0:-1]
	par = target.getParent()
	if not par or par.type() != "transform":
		pmc.error("Parent of target is not transformable.")
		return

	# Create a world object to constrain to
	# User must choose how to organize this new group
	worldLoc = pmc.spaceLocator(n=target+"_WorldOrientLoc")
	pmc.delete(pmc.parentConstraint(par, worldLoc, mo=False))
	# currently maintainOffset is on - is this right?
	pCon = pmc.parentConstraint(worldLoc, par, mo=False)
	# create string of enum options
	spaces = "World"
	for s in sources:
		# this is the format that enumNames wants
		spaces += ":"+s.name()
		# create parent constraint
		pmc.parentConstraint(s, par, mo=False)

	target.addAttr("Orient", at="enum", keyable=True, 
								enumName=spaces)

	# need to wait to set driven keys until ALL constraints have been added
	weights = pCon.getWeightAliasList()
	for i, w in enumerate(weights):
		# w is the weight attr itself
		# set enum, and match attributes to correct 0 or 1 values
		target.Orient.set(i)
		for x in weights:
			if w == x:
				x.set(1)
			else:
				x.set(0)
			# SDK to connect the enum to parent constraint weight
			pmc.setDrivenKeyframe(x, currentDriver=target.Orient)


# create a lofted surface, and kill history...
# or not? just skin "curves" to joints 1:1?
#
def makeRibbon(jnts, axis="z"):
    offset = pmc.datatypes.Vector(
                [float(a == axis.lower()) for a in ["x", "y", "z"]])
    curves = []
    for j in jnts:
        if j.type() != "joint":
            pmc.error("Invalid selection. Select joints only.")
        pos = j.getTranslation(ws=True)
        c = pmc.curve(d=1, p=[(pos+offset), (pos-offset)])
        curves.append(c)
        #pmc.skinCluster(j, c, maxInfluences=1)
    #loft = pmc.loft(curves)
    loft = pmc.loft(curves, ch=False)
    pmc.skinCluster(jnts, loft, maxInfluences=1)
    return loft


# pymel create single follicle script
# by Chris Lesage
def makeFollicle(oNurbs, uPos=0.0, vPos=0.0):
    # manually place and connect a follicle onto a nurbs surface.
    if oNurbs.type() == 'transform':
        oNurbs = oNurbs.getShape()
    elif oNurbs.type() == 'nurbsSurface':
        pass
    else:
        'Warning: Input must be a nurbs surface.'
        return False
    
    # create a name with frame padding
    pName = '_'.join((oNurbs.name(),'follicle','#'.zfill(2)))
    
    oFoll = pmc.createNode('follicle', name=pName)
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

    return oFoll


# print matrix in an easy-to-read way
#
def printMatrix(m):
	print("\n{0}".format(m.nodeName()))
	print(m.longName())
	for r in m.get():
		t = []
		for c in r:
			t.append(float("{0:.3f}".format(c)))
		print(t)

class TesterThing(unittest.TestCase):
	def setUp(self):
		self.c = pmc.circle()[0]

	def tearDown(self):
		pmc.delete(self.c)

	def test_matrix(self):
		printMatrix(self.c.matrix)
		#self.c.rotatePivot.set(1, 1, 1)
		#self.c.scalePivot.set(1, 1, 1)
		pmc.move(1, 1, 1, self.c.rotatePivot, self.c.scalePivot)
		printMatrix(self.c.matrix)

	def test_worldMatrix(self):
		printMatrix(self.c.worldMatrix)
		#self.c.rotatePivot.set(1, 1, 1)
		#self.c.scalePivot.set(1, 1, 1)
		pmc.move(1, 1, 1, self.c.rotatePivot, self.c.scalePivot)
		printMatrix(self.c.worldMatrix)

	def test_worldInverseMatrix(self):
		printMatrix(self.c.worldInverseMatrix)
		#self.c.rotatePivot.set(1, 1, 1)
		#self.c.scalePivot.set(1, 1, 1)
		pmc.move(1, 1, 1, self.c.rotatePivot, self.c.scalePivot)
		printMatrix(self.c.worldInverseMatrix)

def testMatrix():
	suite = unittest.makeSuite(TesterThing)
	testRunner = unittest.TextTestRunner(descriptions=False)
	testRunner.run(suite)

# pivot notes

# connecting inverted translate to rotatePivot and rotatePivotTranslate
# of a CHILD results in opposite translation and no effect from rotation

#