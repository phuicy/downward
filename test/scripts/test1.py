#!/usr/bin/env python
from __future__ import print_function
import sys
import rospy
from downward_msgs.srv import *
import roslib



def preprocess_client(x):
	rospy.wait_for_service('preprocess')
	preprocess_cl = rospy.ServiceProxy('preprocess', preprocess)
	resp1 = preprocess_cl(str(x))
	return resp1.output


def usage():
    return "%s [output.sas]"%sys.argv[0]

if __name__ == "__main__":
    rospy.init_node('test_client')
    if len(sys.argv) == 2:
        x = sys.argv[1]
    else:
        print( usage())
        sys.exit(1)

    with open (x, "r") as myfile:
	data=myfile.read()

    path = roslib.packages.get_pkg_dir('test')

    epath = path + "/test/output"
    f = open(epath,'w')
    print(preprocess_client(data),file=f)
