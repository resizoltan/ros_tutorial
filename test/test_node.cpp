/*
 * test_node.cpp
 *
 *  Created on: Jul 18, 2019
 *      Author: kukauser
 */

#include <gtest/gtest.h>
#include <ros/ros.h>
#include "beginner_tutorials/adder.h"
#include "beginner_tutorials/AddTwoInts.h"

TEST(AdderNode, commonValues)
{
  ros::NodeHandle nh;
  ros::ServiceClient client = nh.serviceClient<beginner_tutorials::AddTwoInts>("add_two_ints");
  beginner_tutorials::AddTwoInts srv;
  srv.request.a = 1;
  srv.request.b = 3;
  ASSERT_TRUE(client.call(srv));
  EXPECT_EQ(srv.response.sum, 4);
}

TEST(AdderNode, wrongResults)
{
  ros::NodeHandle nh;
  ros::ServiceClient client = nh.serviceClient<beginner_tutorials::AddTwoInts>("add_two_ints");
  beginner_tutorials::AddTwoInts srv;
  srv.request.a = 1;
  srv.request.b = 3;
  ASSERT_TRUE(client.call(srv));
  EXPECT_NE(srv.response.sum, 5);
}

int main(int argc, char** argv)
{
  testing::InitGoogleTest(&argc, argv);
  ros::init(argc, argv, "adder_tester");

  return RUN_ALL_TESTS();
}
