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
from functools import partial
import os
import json

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

# naming conventions saved into spline.json file - CHANGE LOCATION
classname = "SplineRig"
rigDataFile = os.environ["AR_DATA"] + "data/rig/spline.json"


#class SplineRig(RigPart):
class SplineRig(object):
	def __init__(self, name=None, jnts=[], stretchy=False, aim=False,
					curve=False, ik=False, numCtrls=3, ctrlStyle="circles"):
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

		# get naming conventions and stuff
		if os.path.exists(rigDataFile):
			self.rigData = json.loads(rcu.readFile(rigDataFile))
		else:
			if not name:
				name = "spline"
			self.rigData = {
				"root": name,
				"group":"_RIG_GRP",
				"joint": "_JNT",
				"locator": "_LOC",
				"locatorGroup": "_LOC_GRP",
				"curve": "_CURVE_RIG",
				"skinJoint": "_RIGJNT",
				"skinJointGroup": "_RIGJNT_GRP",
				"control": "_CTRL",
				"controlGroup": "_CTRL_GRP",
				"first": "_root",
				"last": "_end",
				"middle": "_mid_{:02d}",
				"ikHandle": "_ikHandle"
			}
		#timesaver
		rd = self.rigData

		self.instanceData = {}

		# group for all stuff besides joints & ctrls
		self.rigGrp = pmc.group(empty=True, n=rd["root"]+rd["group"])

		for i, jnt in enumerate(jnts):
			if type(jnt) == pmc.nodetypes.Joint:
				if i == 0:
					jName = rd["root"]+rd["first"]
				elif i == len(jnts)-1:
					jName = rd["root"]+rd["last"]
				else:
					jName = rd["root"]+rd["middle"].format(i)

				loc = pmc.spaceLocator(n=jName + rd["locator"])
				grp = pmc.group(n=jName + rd["locatorGroup"])
				pmc.delete(pmc.parentConstraint(jnt, grp, mo=False))
				self.jnts.append(jnt)
				self.grps.append(grp)
				self.locs.append(loc)
				grp.setParent(self.rigGrp)
			else:
				i-=1

		# curve
		pts = [a.getTranslation(ws=True) for a in self.grps]
		self.curve = pmc.curve(ep=pts, n=rd["root"]+rd["curve"])
		self.curve.setParent(self.rigGrp)

		# ctrls
		if ctrlStyle == "circles":
			ctrlFunc = rcu.makeThickFkCtrl
		elif ctrlStyle == "pins":
			ctrlFunc = rcu.makePinCtrl
		elif ctrlStyle == "boxes":
			ctrlFunc = rcu.makeThickIkCtrl

		if numCtrls < 2:
			pmc.error("Requires more than one control object")
			return
		for n in range(numCtrls):
			# naming edge cases for first and last controls
			if n == 0:
				cName = rd["root"]+rd["first"]
			elif n == numCtrls-1:
				cName = rd["root"]+rd["last"]
			else:
				cName = rd["root"]+rd["middle"].format(n)
			ctrl = ctrlFunc(name=cName+rd["control"])
			ctrlGrp = pmc.group(ctrl, name=cName+rd["controlGroup"])
			# strange pinCtrl bug
			ctrlGrp.rotatePivot.set(0, 0, 0)
			ctrlGrp.scalePivot.set(0, 0, 0)
			self.ctrls.append(ctrl)
			self.orientCtrlGrp(ctrlGrp, n / (numCtrls - 1.0))

		# different rig methods depending on what kind of spline is desired
		if stretchy:
			self.makeStretchy()
		if aim:
			self.makeAim()
		if curve:
			self.attachGrpsToCurve(ik)
			#if not ik:
			axis = self.jnts[1].translate.get().normal()
			ax = ["x", "y", "z"]
			for i in range(3):
				if axis[i] > .99:
					mainAxis = ax.pop(i).upper()
					break
			else:
				pmc.error("Check joint orientation - translated along "
					"multiple axes.")

			self.attachCurveToCtrls(numCtrls, mainAxis)
			# to add twist to groups
			#func = partial(pmc.orientConstraint, skip=ax)
			#self.ctrlsConstrainGroups(func)
			self.ctrlsConstrainGroups(mainAxis)
		else:
			# if no curve, just do smoothstep parent constraints
			self.ctrlsConstrainGroups()

		# if root constrain (option)?
		pmc.pointConstraint(self.grps[0], self.jnts[0], o=(0, 0, 0))


	def attachGrpsToCurve(self, ik):
		"""Creates splineIK system, delete everything but curve.
		Creates PointOnCurve nodes to attaches the groups to
		parameter along curve."""
		if ik:
			ikNodes = pmc.ikHandle(sj=self.jnts[0], ee=self.jnts[-1], 
							solver="ikSplineSolver", createCurve=False,
							curve=self.curve, 
							n=self.rigData["root"]+self.rigData["ikHandle"])
		
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


	def attachCurveToCtrls(self, num, mainAxis):
		"""Excellent way to control a curve without
		the control objects floating away from the curve itself, 
		the way clustering CVs would. Create num amount of ctrls,
		evenly spaced along the curve, then JOINTS right on top of them.
		parentConstrain joints to ctrls, and SKIN curve to joints.
		TWISTING not included."""
		jnts = []
		for i in range(num):
			pmc.select(cl=True)
			ctrl = self.ctrls[i]
			jnt = pmc.joint(n=ctrl.name().replace(self.rigData["control"],
												self.rigData["skinJoint"]))
			pmc.parentConstraint(ctrl, jnt, mo=False)
			# disconnect after constrain so that it is synchronized initially
			#pmc.Attribute(jnt+".rotate"+mainAxis).disconnect()
			jnts.append(jnt)

		jntGrp = pmc.group(jnts, 
					n=self.rigData["root"]+self.rigData["skinJointGroup"])
		jntGrp.setParent(self.rigGrp)
		# skin curve to joints - how to do it so that
		# the influences are smooth and even?
		# iterate through every CV, weight based on distance
		# from joint? Just trust it works okay?
		pmc.skinCluster(jnts, self.curve, maximumInfluences=2)


	def orientCtrlGrp(self, grp, percent):
		"""Given grp along self.curve at given param,
		ensure the grp is oriented right:
		with the rig's primary axis along the curve's tangent"""
		param = percent * self.curve.getKnotDomain()[1]
		pos = self.curve.getPointAtParam(param)
		grp.translate.set(pos)
		if percent == 0.0:
			# just make it the same as the root joint
			#grp.setMatrix(self.jnts[0].matrix.get())
			pmc.delete(pmc.orientConstraint(self.jnts[0], grp, mo=False))
			return
		elif percent == 1.0:
			# similarly, set matrix to end joint
			#grp.setMatrix(self.jnts[-1].matrix.get())
			pmc.delete(pmc.orientConstraint(self.jnts[-1], grp, mo=False))
			return
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
		"""


	def ctrlsConstrainGroups(self, axis=None):
		"""Create constraints ctrl -> grp
		with smoothstep falloff, determined by
		realtive positions along curve"""
		maxU = self.curve.getKnotDomain()[1]
		maxCtrl = len(self.ctrls) - 1.0
		paramCtrlUnit = maxU / maxCtrl
		for n, g in enumerate(self.grps):
			gParam = self.curve.getParamAtPoint(g.getTranslation(ws=True))
			for i, c in enumerate(self.ctrls):
				# paramter value of ctrl along curve
				cParam = i * paramCtrlUnit
				if cParam == gParam:
					# edge case when grp is exactly at ctrl,
					# for beginning and end at least
					if axis:
						# means it's a direct connect
						c.attr("rotate"+axis).connect(g.attr("rotate"+axis))
					else:
						pmc.parentConstraint(c, g, maintainOffset=True)
					break
				elif cParam > gParam:
					# ensure grp is being constrained by only
					# two ctrls - find first cParam which is 
					# greater than gParam, and that ctrl and
					# the previous one affect that g
					prev = self.ctrls[i-1]
					prevParam = (i - 1.0) * paramCtrlUnit
					# smoothstep creates a more curve-like transition
					wght = pmc.util.smoothstep(prevParam, cParam, gParam)
					if axis:
						blend = pmc.nodetypes.BlendColors()
						c.attr("rotate"+axis).connect(blend.color1R)
						prev.attr("rotate"+axis).connect(blend.color2R)
						blend.blender.set(wght)
						blend.outputR.connect(g.attr("rotate"+axis))
					else:
						pmc.parentConstraint(c, g, mo=True, weight=wght)
						pmc.parentConstraint(prev, g, mo=True, weight=1.0 - wght)
					break


	def makeAim(self):
		"""Creates the aimConstraints joints for prevLoc to loc"""
		# each SPAN
		for i, jnt in enumerate(self.jnts):
			grp = self.grps[i]
			loc = self.locs[i]

			pmc.orientConstraint(loc, jnt, mo=False)
			
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
			wuo = prevGrp
			#if not i:
			#	wuo = self.ctrls[0]
			aim = pmc.aimConstraint(loc, prevLoc, aimVector=axis, upVector=arc, 
							worldUpVector=arc, worldUpObject=wuo, 
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


# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'C:\Users\Brendan\Dropbox\Maya Scripts\bkTools\SplineWizard.ui'
#
# Created: Tue Jul 05 14:45:26 2016
#      by: pyside-uic 0.2.14 running on PySide 1.1.1
#
# WARNING! All changes made in this file will be lost!

from PySide import QtCore, QtGui

class Ui_SplineWizard(object):
	def setupUi(self, SplineWizard):
		SplineWizard.setObjectName("SplineWizard")
		SplineWizard.resize(485, 153)
		self.horizontalLayout_4 = QtGui.QHBoxLayout(SplineWizard)
		self.horizontalLayout_4.setContentsMargins(3, 3, 3, 3)
		self.horizontalLayout_4.setObjectName("horizontalLayout_4")
		self.verticalLayout = QtGui.QVBoxLayout()
		self.verticalLayout.setObjectName("verticalLayout")
		self.methodGrp = QtGui.QGroupBox(SplineWizard)
		self.methodGrp.setObjectName("methodGrp")
		self.horizontalLayout_5 = QtGui.QHBoxLayout(self.methodGrp)
		self.horizontalLayout_5.setObjectName("horizontalLayout_5")
		self.methodAim = QtGui.QRadioButton(self.methodGrp)
		self.methodAim.setChecked(True)
		self.methodAim.setObjectName("methodAim")
		self.horizontalLayout_5.addWidget(self.methodAim)
		self.methodIK = QtGui.QRadioButton(self.methodGrp)
		self.methodIK.setChecked(False)
		self.methodIK.setObjectName("methodIK")
		self.horizontalLayout_5.addWidget(self.methodIK)
		self.verticalLayout.addWidget(self.methodGrp)
		self.ctrlGrp = QtGui.QGroupBox(SplineWizard)
		self.ctrlGrp.setObjectName("ctrlGrp")
		self.horizontalLayout_3 = QtGui.QHBoxLayout(self.ctrlGrp)
		self.horizontalLayout_3.setObjectName("horizontalLayout_3")
		self.numLabel = QtGui.QLabel(self.ctrlGrp)
		self.numLabel.setObjectName("numLabel")
		self.horizontalLayout_3.addWidget(self.numLabel)
		self.ctrlNum = QtGui.QLineEdit(self.ctrlGrp)
		sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Ignored, QtGui.QSizePolicy.Fixed)
		sizePolicy.setHorizontalStretch(0)
		sizePolicy.setVerticalStretch(0)
		sizePolicy.setHeightForWidth(self.ctrlNum.sizePolicy().hasHeightForWidth())
		self.ctrlNum.setSizePolicy(sizePolicy)
		self.ctrlNum.setFrame(True)
		self.ctrlNum.setObjectName("ctrlNum")
		self.horizontalLayout_3.addWidget(self.ctrlNum)
		self.styleLabel = QtGui.QLabel(self.ctrlGrp)
		self.styleLabel.setObjectName("styleLabel")
		self.horizontalLayout_3.addWidget(self.styleLabel)
		self.ctrlStyle = QtGui.QComboBox(self.ctrlGrp)
		self.ctrlStyle.setObjectName("ctrlStyle")
		self.ctrlStyle.addItem("")
		self.ctrlStyle.addItem("")
		self.ctrlStyle.addItem("")
		self.horizontalLayout_3.addWidget(self.ctrlStyle)
		self.verticalLayout.addWidget(self.ctrlGrp)
		self.horizontalLayout_4.addLayout(self.verticalLayout)
		self.verticalLayout_2 = QtGui.QVBoxLayout()
		self.verticalLayout_2.setObjectName("verticalLayout_2")
		self.stretchyCheck = QtGui.QCheckBox(SplineWizard)
		self.stretchyCheck.setChecked(True)
		self.stretchyCheck.setObjectName("stretchyCheck")
		self.verticalLayout_2.addWidget(self.stretchyCheck)
		self.curveCheck = QtGui.QCheckBox(SplineWizard)
		self.curveCheck.setChecked(True)
		self.curveCheck.setObjectName("curveCheck")
		self.verticalLayout_2.addWidget(self.curveCheck)
		self.nameGrp = QtGui.QHBoxLayout()
		self.nameGrp.setObjectName("nameGrp")
		self.nameLabel = QtGui.QLabel(SplineWizard)
		self.nameLabel.setObjectName("nameLabel")
		self.nameGrp.addWidget(self.nameLabel)
		self.nameField = QtGui.QLineEdit(SplineWizard)
		self.nameField.setPlaceholderText("")
		self.nameField.setObjectName("nameField")
		self.nameGrp.addWidget(self.nameField)
		self.verticalLayout_2.addLayout(self.nameGrp)
		self.pushButton = QtGui.QPushButton(SplineWizard)
		self.pushButton.setObjectName("pushButton")
		self.verticalLayout_2.addWidget(self.pushButton)
		self.horizontalLayout_4.addLayout(self.verticalLayout_2)

		self.retranslateUi(SplineWizard)
		QtCore.QMetaObject.connectSlotsByName(SplineWizard)


	def retranslateUi(self, SplineWizard):
		SplineWizard.setWindowTitle(QtGui.QApplication.translate("SplineWizard", "SplineWizard", None, QtGui.QApplication.UnicodeUTF8))
		self.methodGrp.setTitle(QtGui.QApplication.translate("SplineWizard", "Joint Rotation Method:", None, QtGui.QApplication.UnicodeUTF8))
		self.methodAim.setText(QtGui.QApplication.translate("SplineWizard", "aim constraints", None, QtGui.QApplication.UnicodeUTF8))
		self.methodIK.setText(QtGui.QApplication.translate("SplineWizard", "maya IKSpline", None, QtGui.QApplication.UnicodeUTF8))
		self.ctrlGrp.setTitle(QtGui.QApplication.translate("SplineWizard", "Controls:", None, QtGui.QApplication.UnicodeUTF8))
		self.numLabel.setText(QtGui.QApplication.translate("SplineWizard", "Number:", None, QtGui.QApplication.UnicodeUTF8))
		self.ctrlNum.setText(QtGui.QApplication.translate("SplineWizard", "3", None, QtGui.QApplication.UnicodeUTF8))
		self.styleLabel.setText(QtGui.QApplication.translate("SplineWizard", "Style:", None, QtGui.QApplication.UnicodeUTF8))
		self.ctrlStyle.setItemText(0, QtGui.QApplication.translate("SplineWizard", "circles", None, QtGui.QApplication.UnicodeUTF8))
		self.ctrlStyle.setItemText(1, QtGui.QApplication.translate("SplineWizard", "pins", None, QtGui.QApplication.UnicodeUTF8))
		self.ctrlStyle.setItemText(2, QtGui.QApplication.translate("SplineWizard", "boxes", None, QtGui.QApplication.UnicodeUTF8))
		self.stretchyCheck.setText(QtGui.QApplication.translate("SplineWizard", "Stretchy", None, QtGui.QApplication.UnicodeUTF8))
		self.curveCheck.setText(QtGui.QApplication.translate("SplineWizard", "Control with curve", None, QtGui.QApplication.UnicodeUTF8))
		self.nameLabel.setText(QtGui.QApplication.translate("SplineWizard", "Limb name", None, QtGui.QApplication.UnicodeUTF8))
		self.nameField.setText(QtGui.QApplication.translate("SplineWizard", "character_spine", None, QtGui.QApplication.UnicodeUTF8))
		self.pushButton.setText(QtGui.QApplication.translate("SplineWizard", "Create Spline Rig", None, QtGui.QApplication.UnicodeUTF8))

	
	def customConnections(self):
		# if no curve, IK is not an option.
		# FALSE should automatically toggle aim w/ twist
		self.curveCheck.toggled.connect(self.fixMethod)
		# validator on num ctrls field
		vldtr = QtGui.QIntValidator(2, 99)
		self.ctrlNum.setValidator(vldtr)

		self.pushButton.clicked.connect(self.makeSpline)


	def fixMethod(self, curveState):
		self.methodIK.setEnabled(curveState)
		if not curveState:
			self.methodAim.setChecked(True)
		

	def makeSpline(self):
		name = self.nameField.text()
		stretchy = self.stretchyCheck.isChecked()
		curve = self.curveCheck.isChecked()
		aim = self.methodAim.isChecked()
		ik = self.methodIK.isChecked()
		numCtrls = int(self.ctrlNum.text())
		ctrlStyle = self.ctrlStyle.currentText()

		with rcu.MayaUndoChunkManager():
			rig = SplineRig(name=name, stretchy=stretchy, curve=curve, 
					aim=aim, ik=ik, numCtrls=numCtrls, ctrlStyle=ctrlStyle)



# Easy creation of Spline creation wizard.
# Just add to some window.
class SplineGui(Ui_SplineWizard, QtGui.QWidget):
	def __init__(self, parent=None):
		super(SplineGui, self).__init__(parent)
		self.setupUi(self)
		self.customConnections()


def makeGuiWindow():
	main = rcu.getMayaMainWindow()
	wizard = SplineGui(main)
	wizard.setWindowFlags(QtCore.Qt.Window)
	wizard.show()
	return wizard

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