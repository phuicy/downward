#include "globals.h"
#include "operator.h"
#include "option_parser.h"
#include "ext/tree_util.hh"
#include "timer.h"
#include "utilities.h"
#include "search_engine.h"
#include "ros/ros.h"


#include <sstream>
#include <string> 
#include <iostream>

#include "downward_msgs/search.h"

using namespace std;



class searchal {
	public:
		searchal(){}
		~searchal(){


		}
		void search(downward_msgs::search::Request &req, downward_msgs::search::Response &res);
};

void searchal::search(downward_msgs::search::Request &req, downward_msgs::search::Response &res){
    register_event_handlers();

    istringstream iss(req.output);

    read_everything(iss);

    SearchEngine *engine = 0;

    std::string s1, s2, s3;
    ros::param::param<std::string>("heuristic", s1, "");
    ros::param::param<std::string>("landmarks", s2, "");
    ros::param::param<std::string>("search", s3, "astar(blind())");

    if(s1=="" && s2==""){
	OptionParser::parse_cmd_line(s3, true);
	engine = OptionParser::parse_cmd_line(s3, false);
    }else if(s1==""){
	OptionParser::parse_cmd_line(s1,s2,s3, true);
	engine = OptionParser::parse_cmd_line(s1,s3, false);
    }else{
	OptionParser::parse_cmd_line(s1,s2,s3, true);
	engine = OptionParser::parse_cmd_line(s1,s2,s3, false); 
    }

    Timer search_timer;

    engine->search();

    search_timer.stop();
    g_timer.stop();

    string s213 = engine->ros_plan_if_necessary();

    string s213d = engine->ros_plan_cost_if_necessary();
    //engine->statistics();
    //engine->heuristic_statistics();
    cout << "Search time: " << search_timer << endl;
    cout << "Total time: " << g_timer << endl;
    //cout << "here4" << endl;
    res.search = s213;

    //g_transition_graphs.clear();
    //delete g_legacy_causal_graph;
    //delete g_causal_graph;
    //delete engine;
    //delete g_initial_state;

    clear_all();
}




bool searcher(downward_msgs::search::Request &req, downward_msgs::search::Response &res) {
    searchal *builder = new searchal();
    builder->search(req,res);
    delete builder;
    return true;
}


int main(int argc, char **argv) {
  ros::init(argc, argv, "search_server");
  ros::NodeHandle n;

  ros::ServiceServer service = n.advertiseService("search", searcher);
  ROS_INFO("Ready to Search");
  ros::spin();
}

