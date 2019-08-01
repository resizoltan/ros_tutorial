#include "ros/ros.h"
#include "beginner_tutorials/AddTwoInts.h"
#include "beginner_tutorials/adder.h"
#include "std_msgs/String.h"
#include <sstream>

class AdderROSInterface
{
private:
  Adder adder;
  ros::NodeHandle n;
  ros::ServiceServer service;
  ros::Publisher publisher;

public:
  AdderROSInterface(ros::NodeHandle n, Adder& adder)
  {
    this->adder = adder;
    this->adder.AddHandler(std::bind(&AdderROSInterface::NumberOfCallsCallback, this, std::placeholders::_1));
    publisher = n.advertise<std_msgs::String>("add_count", 1000);
    service = n.advertiseService("add_two_ints", &AdderROSInterface::add, this);
    ROS_INFO("Ready to add two ints.");
  }

public:
  bool add(beginner_tutorials::AddTwoInts::Request& req, beginner_tutorials::AddTwoInts::Response& res)
  {
    res.sum = adder.Add(req.a, req.b);
    ROS_INFO("request: x=%ld, y=%ld", (long int)req.a, (long int)req.b);
    ROS_INFO("sending back response: [%ld]", (long int)res.sum);
    return true;
  }

  void NumberOfCallsCallback(const int& count)
  {
    std_msgs::String msg;
    std::stringstream ss;
    ss << "Number of calls on " << adder.GetID() << ": " << count;
    msg.data = ss.str();
    ROS_INFO("Count increased.");
    publisher.publish(msg);
  }
};

int main(int argc, char** argv)
{
  ros::init(argc, argv, "add_two_ints_server");
  ros::NodeHandle n;

  Adder myAdder("My Adder");
  AdderROSInterface myAdderROSInterface(n, myAdder);

  ros::spin();

  return 0;
}
