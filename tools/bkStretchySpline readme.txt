Create a stretchy spline-like rig.
CAUTION: Your skeleton MUST be well-oriented for stable use of the rigs.
Improperly oriented skeletons result in strange flipping behavior.

# how to use
EASY:
    Create a bkStretchySpline.SplineGui instance inside your rigging ui window!
    The GUI is a wizard that lets you pick between the different spline creation options.
    Simply prepare your parent widget, and call bkStretchySpline.SplineGui(parent).

COMMAND LINE:
rig = bkStretchySpline.SplineRig(args)

args - all optional. Booleans default to None:
    - name="hope_Spine"
    - jnts= [list of PyMel joint objects - if not given, current selection is used - 
                in this case, EACH joint in the chain must be selected]
    - stretchy=(True/False) - if True, stretch is piped into primary axis translate of child joint
    - aim=(True/False) - if True, joint rotations are determined by aimConstraints
    - curve=(True/False) - if True, create a curve which controls the rig. Like default Maya IkSpline, except stretchy!
    - ik=(True/False) - if True AND curve arg is True, joint rotations are controlled by default Maya IkSpline. Alternative to "aim" arg.
    - numCtrls=int - if curve=True, create pin ctrls which control rig via skinCluster. Otherwise, create thick FK ctrls which control the rig via parentConstraints. If no controls are desired, pass in 0. Default is 3.
    
Recommended to get the gist of it:

rig = bkStretchySpline.SplineRig(name="spine", stretchy=True, aim=True)