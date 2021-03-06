cmake_minimum_required(VERSION 2.8.3)
project(search)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  downward_msgs
  roscpp
)
#SET( CMAKE_CXX_FLAGS "-Wall -W -Wno-sign-compare -Wno-deprecated -ansi -pedantic -Werror -L" )
SET( CMAKE_CXX_FLAGS "-Wno-sign-compare -Wno-deprecated" )
## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)

## Uncomment this if the package has a setup.py. This macro ensures
## modules and global scripts declared therein get installed
## See http://ros.org/doc/api/catkin/html/user_guide/setup_dot_py.html
# catkin_python_setup()

################################################
## Declare ROS messages, services and actions ##
################################################

## To declare and build messages, services or actions from within this
## package, follow these steps:
## * Let MSG_DEP_SET be the set of packages whose message types you use in
##   your messages/services/actions (e.g. std_msgs, actionlib_msgs, ...).
## * In the file package.xml:
##   * add a build_depend and a run_depend tag for each package in MSG_DEP_SET
##   * If MSG_DEP_SET isn't empty the following dependencies might have been
##     pulled in transitively but can be declared for certainty nonetheless:
##     * add a build_depend tag for "message_generation"
##     * add a run_depend tag for "message_runtime"
## * In this file (CMakeLists.txt):
##   * add "message_generation" and every package in MSG_DEP_SET to
##     find_package(catkin REQUIRED COMPONENTS ...)
##   * add "message_runtime" and every package in MSG_DEP_SET to
##     catkin_package(CATKIN_DEPENDS ...)
##   * uncomment the add_*_files sections below as needed
##     and list every .msg/.srv/.action file to be processed
##   * uncomment the generate_messages entry below
##   * add every package in MSG_DEP_SET to generate_messages(DEPENDENCIES ...)

## Generate messages in the 'msg' folder
# add_message_files(
#   FILES
#   Message1.msg
#   Message2.msg
# )

## Generate services in the 'srv' folder
# add_service_files(
#   FILES
#   Service1.srv
#   Service2.srv
# )

## Generate actions in the 'action' folder
# add_action_files(
#   FILES
#   Action1.action
#   Action2.action
# )

## Generate added messages and services with any dependencies listed here
# generate_messages(
#   DEPENDENCIES
#   downward_msgs
# )

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if you package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES search
#  CATKIN_DEPENDS downward_msgs roscpp
#  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
 include_directories(include)
 include_directories(src/ext)
 include_directories(src)
include_directories(
  ${catkin_INCLUDE_DIRS}
)

## Declare a cpp library
# add_library(search
#   src/${PROJECT_NAME}/search.cpp
# )

## Declare a cpp executable
add_executable(search_server 
		src/additive_heuristic.cc
		src/axioms.cc
		src/blind_search_heuristic.cc
		src/causal_graph.cc
		src/cea_heuristic.cc
		src/cg_cache.cc
		src/cg_heuristic.cc
		src/combining_evaluator.cc
		src/domain_transition_graph.cc
		src/eager_search.cc
		src/enforced_hill_climbing_search.cc
		src/exact_timer.cc
		src/ff_heuristic.cc
		src/g_evaluator.cc
		src/globals.cc
		src/goal_count_heuristic.cc
		src/heuristic.cc
		src/hm_heuristic.cc
		src/ipc_max_heuristic.cc
		src/iterated_search.cc
		src/lazy_search.cc
		src/legacy_causal_graph.cc
		src/lm_cut_heuristic.cc
		src/max_evaluator.cc
		src/max_heuristic.cc
		src/operator.cc
		src/operator_cost.cc
		src/option_parser.cc
		src/planner.cc
		src/pref_evaluator.cc
		src/relaxation_heuristic.cc
		src/rng.cc
		src/search_engine.cc
		src/search_node_info.cc
		src/search_progress.cc
		src/search_space.cc
		src/state.cc
		src/state_proxy.cc
		src/successor_generator.cc
		src/sum_evaluator.cc
		src/timer.cc
		src/utilities.cc
		src/weighted_evaluator.cc

		src/open_lists/alternation_open_list.cc  
		src/open_lists/open_list_buckets.cc  
		src/open_lists/pareto_open_list.cc  
		src/open_lists/standard_scalar_open_list.cc  
		src/open_lists/tiebreaking_open_list.cc  

		src/merge_and_shrink/abstraction.cc 
		src/merge_and_shrink/label_reducer.cc 
		src/merge_and_shrink/merge_and_shrink_heuristic.cc 
		src/merge_and_shrink/shrink_bisimulation.cc 
		src/merge_and_shrink/shrink_bucket_based.cc 
		src/merge_and_shrink/shrink_fh.cc 
		src/merge_and_shrink/shrink_random.cc 
		src/merge_and_shrink/shrink_strategy.cc 
		src/merge_and_shrink/variable_order_finder.cc

		src/landmarks/exploration.cc 
		src/landmarks/h_m_landmarks.cc 
		src/landmarks/lama_ff_synergy.cc 
		src/landmarks/landmark_cost_assignment.cc 
		src/landmarks/landmark_count_heuristic.cc 
		src/landmarks/landmark_status_manager.cc 
		src/landmarks/landmark_graph_merged.cc 
		src/landmarks/landmark_graph.cc 
		src/landmarks/landmark_factory.cc 
		src/landmarks/landmark_factory_rpg_exhaust.cc 
		src/landmarks/landmark_factory_rpg_sasp.cc 
		src/landmarks/landmark_factory_zhu_givan.cc 
		src/landmarks/util.cc  

		src/learning/AODE.cc 
		src/learning/classifier.cc 
		src/learning/composite_feature_extractor.cc 
		src/learning/feature_extractor.cc 
		src/learning/maximum_heuristic.cc 
		src/learning/naive_bayes_classifier.cc 
		src/learning/PDB_state_space_sample.cc 
		src/learning/probe_state_space_sample.cc 
		src/learning/selective_max_heuristic.cc 
		src/learning/state_space_sample.cc 
		src/learning/state_vars_feature_extractor.cc 

		src/pdbs/canonical_pdbs_heuristic.cc 
		src/pdbs/dominance_pruner.cc 
		src/pdbs/match_tree.cc 
		src/pdbs/max_cliques.cc 
		src/pdbs/pattern_generation_edelkamp.cc 
		src/pdbs/pattern_generation_haslum.cc 
		src/pdbs/pdb_heuristic.cc 
		src/pdbs/util.cc 
		src/pdbs/zero_one_pdbs_heuristic.cc 
		  
)

## Add cmake target dependencies of the executable/library
## as an example, message headers may need to be generated before nodes
 add_dependencies(search_server downward_msgs_generate_messages_cpp)

## Specify libraries to link a library or executable target against
 target_link_libraries(search_server
   ${catkin_LIBRARIES} rt pthread
 )

#############
## Install ##
#############

# all install targets should use catkin DESTINATION variables
# See http://ros.org/doc/api/catkin/html/adv_user_guide/variables.html

## Mark executable scripts (Python etc.) for installation
## in contrast to setup.py, you can choose the destination
# install(PROGRAMS
#   scripts/my_python_script
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark executables and/or libraries for installation
# install(TARGETS search search_node
#   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark cpp header files for installation
# install(DIRECTORY include/${PROJECT_NAME}/
#   DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
#   FILES_MATCHING PATTERN "*.h"
#   PATTERN ".svn" EXCLUDE
# )

## Mark other files for installation (e.g. launch and bag files, etc.)
# install(FILES
#   # myfile1
#   # myfile2
#   DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
# )

#############
## Testing ##
#############

## Add gtest based cpp test target and link libraries
# catkin_add_gtest(${PROJECT_NAME}-test test/test_search.cpp)
# if(TARGET ${PROJECT_NAME}-test)
#   target_link_libraries(${PROJECT_NAME}-test ${PROJECT_NAME})
# endif()

## Add folders to be run by python nosetests
# catkin_add_nosetests(test)
