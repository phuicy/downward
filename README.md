# Downward : A ROS implemenatation of the Fast Downward Planner

[![Build Status](https://secure.travis-ci.org/libcpu/libcpu.png?branch=master)](http://travis-ci.org/libcpu/libcpu)

"Downward" is a [ROS](http://ros.org/ "Robot Operating System") is a modularised implemenation of the [Fast Downward](http://www.fast-downward.org/ "www.fast-downward.org") PDDL planner. It is implemented as a ROS [action server](http://wiki.ros.org/actionlib "actionlib"), with individual services underneath this server. All the various hueristics and algorithms available to Fast Downward at run-time via the ROS [parameters](http://wiki.ros.org/Parameter%20Server "Parameter Server"). 

## Table of Contents

- [Description](#description)
- [Installation](#installation)
	- [Pre-requirements](#pre-requirements)
	- [Installation Steps](#installation-steps)
- [How to Run](#how to run)
- [Parameters](#parameters) 


##Description

<img src="https://raw.github.com/phuicy/downward/master/image/downward1.png" alt="Downward action server" align="right" width="450"/>


Downward is composed of 1 meta-package, and 6 packages. The packages are:
- *downward_msgs*: contains and creates all ROS .msgs, .srv and .actions for Downward.
- *translate*: contains a python service node which take PDDL and converts to SAS.
- *preprocess*: contains a c++ service node which takes SAS and returns a preprocessed SAS.
- *search*: contains a C++ service node that takes the preprocessed and finds a solution (or not); which is returned in the normal downward form.
- *planner*: contains the c++ action server that invokes all the aforementioned services, to create a solution from the PDDL, and return it as a result. Feedback from the action server is also avialable, this feedback contains information such as the state of the processing.
- *test*: contains python scripts and test files (e.g. PDDL) for testing the action server.

The Goal message for the downward action server is A PDDL file. 
There exists a launch file for all elements in the planner/launch. The parameters are:
- heuristic,
- landmarks,
- search.

For more information see [parameters](#parameters).


##Installation

Can built on apple and linux. However, easiest build is on ubuntu as rosdep is setup for ubuntu.

###Pre-requirement
To obtain and build the planner, you need a reasonably modern version of the GNU C++ compiler, and the usual build tools such as GNU make. For the validator, VAL, you will need flex and bison. To run the planner, you also need Python 2.7 (The translator will also run under Python 3.x and can be forced to use the slow Python 2.6) as well as gawk. These dependencies are often satisfied by default on development machines. If not,
```
sudo apt-get install g++ make python flex bison gawk
```
If you are using an x64 system, you will probably also need to run
```
sudo apt-get install g++-multilib
```

This can also all be achieved by the rosdep.

###Installation Steps
Simple 
```
catkin_make
```

##How to Run
Simply run:
```
roslaunch planner planner.launch
```

##Parmeters
TBC



