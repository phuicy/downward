#!/usr/bin/env python
from __future__ import print_function
import sys
import rospy
from downward_msgs.srv import *
import roslib

def translate_client(x, y):
	rospy.wait_for_service('translator')
	translate_cl = rospy.ServiceProxy('translator', translate)
	resp1 = translate_cl(str(x), str(y))
	return resp1.output


def usage():
    return "%s [domain.pddl problem.pddl]"%sys.argv[0]

if __name__ == "__main__":
    rospy.init_node('test_client')
    if len(sys.argv) == 3:
        x = sys.argv[1]
        y = sys.argv[2]
    else:
        print( usage())
        sys.exit(1)

    with open (x, "r") as myfile:
	dataD=myfile.read()
    with open (y, "r") as myfile:
	dataP=myfile.read()
    #print "Requesting %s+%s translated to SAS"%(x, y)


    path = roslib.packages.get_pkg_dir('test')
    epath = path+"/test/output.sas"

    f = open(epath,'w')
    print(translate_client(dataP, dataD),file=f)
