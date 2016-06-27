"""
Ribbon-esque spline rig. Basically just makes 
groups which can be simply parent constrained 
to ctrl objects, groups convert xforms into
rotation and stretch-along-axis for the joints.
For making things like spines, lips,
tentacles, eyelids, whatever.
"""

#from zooPyMaya.baseSkeletonBuilder import *
import pymel.core as pmc
import rigCtrlUtil as rcu
import unittest
from random import random

"""
class Spline(SkeletonPart):
	zooToolBox SkeletonPart
	creates a joint chain of given length,
	which is later rigged to a a spline
	which is directly controlled
	

	HAS_PARITY = False

	@classmethod
	def _build(cls, parent=None, **args):
		pass
"""


#class SplineRig(RigPart):
class SplineRig(object):
	def __init__(self, name=None, jnts=[], stretchy=False, aim=False,
							curve=False, ik=False, numCtrls=3):
		self.jnts = []
		self.grps = []
		self.locs = []
		self.ctrls = []
		self.curve = None

		if not jnts:
			jnts = pmc.ls(sl=True)
		
		if len(jnts) < 2:
			pmc.error("Not enough joints! Select or pass in two or more joints.")
			return

		if name:
			self.name = name
			# rename jnts?
		else:
			self.name = jnts[0].name()
		self.rigGrp = pmc.group(empty=True, n=self.name+"_SPLINE_GRP")

		i = 1
		for jnt in jnts:
			try:
				if jnt.type() == "joint":
					#jnt.rename(self.name+"_JNT{0}".format(i))
					jName = jnt.name()
					loc = pmc.spaceLocator(n=jName+"_LOC")
					grp = pmc.group(n=jName+"_LOCGRP")
					pmc.delete(pmc.parentConstraint(jnt, grp, mo=False))
					self.jnts.append(jnt)
					self.grps.append(grp)
					self.locs.append(loc)
					grp.setParent(self.rigGrp)
					i+=1
			except AttributeError:
				pass

		# different rig methods depending on what kind of spline is desired
		if stretchy:
			self.makeStretchy()
		if aim:
			self.makeAim((curve and ik))
		if curve:
			self.attachGrpsToCurve(ik)
			if not ik:
				self.attachCurveToCtrls(numCtrls)
				#pass
		else:
			self.normalCtrls(numCtrls)

		pmc.pointConstraint(self.grps[0], self.jnts[0], o=(0, 0, 0))


	def attachGrpsToCurve(self, ik):
		"""Creates splineIK system, delete everything but curve.
		Creates PointOnCurve nodes to attaches the groups to
		parameter along curve."""
		ikNodes = pmc.ikHandle(sj=self.jnts[0], ee=self.jnts[-1], 
								solver="ikSplineSolver")
		self.curve = ikNodes.pop()
		self.curve.rename(self.name+"_CRV")
		self.curve.setParent(self.rigGrp)
		if not ik:
			# kill ik handle
			pmc.delete(ikNodes[0])
		endParam = self.curve.max.get()
		for i, g in enumerate(self.grps):
			onCurve = self.curve.closestPoint(g.translate.get())
			param = self.curve.getParamAtPoint(onCurve)
			poc = pmc.nodetypes.PointOnCurveInfo(n=g.name()+"_PoC")
			self.curve.ws.connect(poc.inputCurve)
			# may have to switch to a percent-based parameter system
			poc.turnOnPercentage.set(True)
			poc.parameter.set(param/endParam)
			poc.position.connect(g.translate)


	def attachCurveToCtrls(self, num):
		"""Excellent way to control a curve without
		the control objects floating away from the curve itself, 
		the way clustering CVs would. Create num amount of ctrls,
		evenly spaced along the curve, then JOINTS right on top of them.
		parentConstrain joints to ctrls, and SKIN curve to joints."""
		if num < 2:
			pmc.error("Requires more than one control object")
			return
		cName = self.curve.name()
		endParam = self.curve.max.get()
		jnts = []
		for i in range(num):
			pmc.select(cl=True)
			param = i * endParam / (num - 1.0)
			ctrl = rcu.makePinCtrl(name=cName+"_CTRL{0}".format(i+1))
			grp = pmc.group(n=cName+"_CTRLGRP{0}".format(i+1))
			jnt = pmc.joint(n=cName+"_CTRLJNT{0}".format(i+1))
			pmc.parentConstraint(ctrl, jnt, mo=False)
			# move to correct place, orient correctly via matrix
			self.orientCtrlGrp(grp, param)

			jnts.append(jnt)
			self.ctrls.append(ctrl)
		jntGrp = pmc.group(jnts, n=cName+"_CTRLJNT_GRP")
		jntGrp.setParent(self.rigGrp)
		# skin curve to joints - how to do it so that
		# the influences are linear?
		# iterate through every CV, weight based on distance
		# from joint? Just trust it works okay?
		pmc.skinCluster(jnts, self.curve, maximumInfluences=2)


	def orientCtrlGrp(self, grp, param):
		pos = self.curve.getPointAtParam(param)
		grp.translate.set(pos)
		if param == 0.0:
			param += 0.01
		elif param == self.curve.max.get():
			param -= 0.01
		axis = self.jnts[1].translate.get().normal()
		arc = self.jnts[1].jointOrient.get().normal()
		pmc.delete(pmc.tangentConstraint(self.curve, grp, aimVector=axis, upVector=arc,
						worldUpVector=arc, worldUpObject=self.jnts[1]))
		"""
		jointCurveAxis = self.jnts[1].jointOrient.get().normal()
		axis = self.jnts[1].translate.get().normal()
		mat = grp.getMatrix(ws=True)
		# don't know which axis each vector should
		# correspond to, so check x, y and zs of some joint vectors
		primAxis = self.curve.tangent(param)
		crossAxis = primAxis.cross(jointCurveAxis)
		for i in range(3):
			if abs(axis[i]) > .99:
				mat[i] = primAxis
				print("rewriting 1")
			elif abs(jointCurveAxis[i]) > .99:
				print("rewriting 2")
				mat[i] = jointCurveAxis
			else:
				# if i (x, y or z index) is not found to be
				# correct for EITHER joint translate axis 
				# or joint orient axis, that means this one
				# is the crossAxis
				print("rewriting 3")
				mat[i] = crossAxis
		grp.setMatrix(mat, ws=True)
		grp.scale.set(1, 1, 1)
		#"""


	def normalCtrls(self, num):
		"""make given number of ctrls, evenly space them,
		and evenly weight the parent constraints based on 
		ratio of grps to numCtrls"""
		pts = [a.getTranslation(ws=True) for a in self.grps]
		self.curve = pmc.curve(ep=pts, name=self.name+"_CRV")
		self.curve.setParent(self.rigGrp)
		maxU = self.curve.getKnotDomain()[1]
		cParams = []
		#npoc = pmc.nodetypes.NearestPointOnCurve()
		for i in range(num):
			c = rcu.makeThickFkCtrl(name=(self.name+"_CTRL"))
			cGrp = pmc.group(c, name=(c.name()+"_GRP"))
			# get param and move group into place
			cParam = i / (num - 1.0) * maxU
			self.orientCtrlGrp(cGrp, cParam)

			self.ctrls.append(c)
			cParams.append(cParam)
		for n, g in enumerate(self.grps):
			gParam = self.curve.getParamAtPoint(pts[n])
			for i, c in enumerate(self.ctrls):
				cParam = cParams[i]
				if cParam == gParam:
					# edge case when grp is exactly at ctrl,
					# for beginning and end at least
					pmc.parentConstraint(c, g, maintainOffset=True)
					break
				elif cParam > gParam:
					# ensure grp is being constrained by only
					# two ctrls - find first cParam which is 
					# greater than gParam, and that ctrl and
					# the previous one affect that g
					prev = self.ctrls[i-1]
					prevParam = cParams[i-1]
					# calculate weight - a ratio of differences
					# in parameter
					span = cParam - prevParam
					dist = cParam - gParam
					wght = (span - dist) / span
					pmc.parentConstraint(c, g, maintainOffset=True, 
									weight=wght)
					prevDist = gParam - prevParam
					prevWght = (span - prevDist) / span
					pmc.parentConstraint(prev, g, maintainOffset=True, 
									weight=prevWght)
					break
		pmc.delete(self.curve)


	def makeCurveTwisty(self):
		# possible ik system - make chain, duplicate.
		# for each in duplicate, parent joint under group
		# with 0 xforms, orientConstrain the IK chain

		sel = pmc.ls(sl=True)
		ikChain = pmc.duplicate(sel, po=True, rc=True)
		ik = pmc.ikHandle(sj=ikChain[0], ee=ikChain[-1])
		for i, j in enumerate(sel):
		    g = pmc.group(empty=True)
		    g.setParent(j.getParent())
		    pmc.delete(pmc.parentConstraint(j, g, mo=False))
		    j.setParent(g)
		    pmc.orientConstraint(ikChain[i], g, o=(0, 0, 0))
		    ctrl = rcu.makeThickIkCtrl()
		    cg = pmc.group(ctrl)
		    

		# intergrate the "position" and "closest joint"
		# functionality from variableFK into
		# bkStretchySpline - giving the ability for each control
		# to affect the GROUPS in a variable weighted way

		# that would remove the need to use curve/ik -
		# JUST pipe the same orientConstraint weights 
		# which variableFK uses into the parentConstraint
		# for each group


	def makeAim(self, ik):
		"""Creates the aimConstraints joints for prevLoc to loc"""
		# each SPAN
		for i, jnt in enumerate(self.jnts):
			grp = self.grps[i]
			loc = self.locs[i]

			if not ik:
				pmc.orientConstraint(loc, jnt)
			
			if not i:
				# if root joint, pointConstrain(?) and move along -
				# next part is for each SPAN only
				continue

			prevJnt = self.jnts[i - 1]
			prevGrp = self.grps[i - 1]
			prevLoc = self.locs[i - 1]

			# if empty, getParent returns None, getChildren returns []
			if jnt not in prevJnt.getChildren():
				pmc.warning("It is recommended that joints be in a heirarchy,"
						" and be selected in heirarchical order.")
			
			# get one locator to aim at the other, which produces rotation
			# values which can be piped into joint rotation
			axis = jnt.translate.get().normal()
			arc = jnt.jointOrient.get().normal()
			aim = pmc.aimConstraint(loc, prevLoc, aimVector=axis, upVector=arc, 
							worldUpVector=arc, worldUpObject=prevGrp, 
							wut="objectrotation")


	def makeStretchy(self, method="translate"):
		"""Add the distance measuring node and pipe offset amount
		into joint's translate/scale value"""
		for i in range(1, len(self.jnts)):
			jnt = self.jnts[i]
			grp = self.grps[i]
			prevJnt = self.jnts[i - 1]
			prevGrp = self.grps[i - 1]
			jName = jnt.name()
			axis = jnt.translate.get().normal()

			# Stretchy time
			dist = pmc.nodetypes.DistanceBetween(n=jName+"_DIST")
			prevGrp.translate.connect(dist.point1)
			grp.translate.connect(dist.point2)

			if method == "translate":
				# distanceBetween value pipes into CHILD joint's translate
				if axis.x > .99:
					dist.distance.connect(jnt.translateX)
				elif axis.y > .99:
					dist.distance.connect(jnt.translateY)
				elif axis.z > .99:
					dist.distance.connect(jnt.translateZ)
				else:
					pmc.error("\nCheck joint orientations - joint is "
						"transformed along multiple axes.\nOffending joint "
						"was {0}, with a translation of {1}".format(jnt, axis))
					return
			
			elif method == "scale":
				# distanceBetween value pipes into PARENT joint's scale
				# after going through normalization
				div = pmc.nodetypes.multiplyDivide(n=jName+"_DIV")
				dist.distance.connect(div.input1X)
				curr = div.input1X.get()
				if curr == 0:
					pmc.error("Distance between joints {0} and {1} is 0. "
								"Cannot divide by 0.".format(jnt, prevJnt))
					return
				div.input2X.set(curr)
				div.operation.set(2)
				if axis.x > .99:
					div.outputX.connect(prevJnt.scaleX)
				elif axis.y > .99:
					div.outputX.connect(prevJnt.scaleY)
				elif axis.z > .99:
					div.outputX.connect(prevJnt.scaleZ)
				else:
					pmc.error("\nCheck joint orientations - joint is "
						"transformed along multiple axes.\nOffending joint "
						"was {0}, with a translation of {1}".format(jnt, axis))
					return




"""
------------------------------------------------------------------------------
##############################################################################
------------------------------------------------------------------------------
"""



# Test it
class SplineRigTester(unittest.TestCase):
	"""test fixture for SplineRig"""
	def setUp(self):
		"Create a NEW setup of "
		pmc.select(clear=True)
		jnts = []
		for x in range(5):
			j = pmc.joint()
			j.translate.set(random()*2, random()*2, random()*2)
			jnts.append(j)
		jnts[0].orientJoint("xyz", sao="yup", children=True)
		pmc.select(jnts)


	def tearDown(self):
		pass

	def test_noArgs(self):
		obj = SplineRig()
		self.assertEqual(len(obj.jnts), 5)
		self.assertEqual(len(obj.grps), 5)
		self.assertEqual(len(obj.locs), 5)

	def test_jntArgs(self):
		j = pmc.ls(sl=True)
		obj = SplineRig(jnts=j)
		self.assertEqual(len(obj.jnts), 5)
		self.assertEqual(len(obj.grps), 5)
		self.assertEqual(len(obj.locs), 5)

	def test_aim(self):
		obj = SplineRig(aim=True)
		for i in range(1, len(obj.jnts)):
			j = obj.jnts[i]
			# rotate channels will have inputs 
			self.assertTrue(j.rotateX.isConnected())


	def test_stretchy(self):
		obj = SplineRig(stretchy=True)

	def test_curve(self):
		obj = SplineRig(curve=True)
		self.assertIsNotNone(obj.curve)

	def test_ctrls(self):
		"""should result in error, no curve object"""
		obj = SplineRig(numCtrls=4)

	def test_curveCtrls(self):
		obj = SplineRig(curve=True, numCtrls=4)


		#obj = SplineRig("stretchy", "aim", "curve", curveCtrls=4)



# run tests
def runTests():
	suite = unittest.makeSuite(SplineRigTester)
	testRunner = unittest.TextTestRunner(descriptions=False)
	testRunner.run(suite)