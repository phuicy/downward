# Downward : A ROS implemenatation of the Fast Downward Planner

"Downward" is a [ROS](http://ros.org/ "Robot Operating System") is a modularised implemenation of the [Fast Downward](http://www.fast-downward.org/ "www.fast-downward.org") PDDL planner. It is implemented as a ROS [action server](http://wiki.ros.org/actionlib "actionlib"), with individual services underneath this server. All the various hueristics and algorithms available to Fast Downward at run-time via the ROS [parameters](http://wiki.ros.org/Parameter%20Server "Parameter Server"). 

## Table of Contents

- [Description](#description)
- [Installation](#installation)
	- [Pre-requirements](#pre-requirements)
	- [Installation Steps](#installation-steps)
- [How to Run](#how-to-run)


##Description

<img src="https://raw.github.com/phuicy/downward/master/image/downward1.png" alt="Downward action server" align="right" />


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
