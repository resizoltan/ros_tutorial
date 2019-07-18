/*
 * test.cpp
 *
 *  Created on: Jul 18, 2019
 *      Author: kukauser
 */

#include "beginner_tutorials/adder.h"
#include <gtest/gtest.h>

TEST(AdderLib, commonValues)
{
	Adder adder("Test Adder");
	EXPECT_EQ(adder.Add(1,3), 4);
	EXPECT_EQ(adder.Add(56,170), 226);
	EXPECT_EQ(adder.Add(-3,10), 7);
	EXPECT_EQ(adder.Add(199,-50), 149);
	EXPECT_EQ(adder.Add(3450,8712), 12162);
}

TEST(AdderLib, wrongResults)
{
	Adder adder("Test Adder");
	EXPECT_NE(adder.Add(1,3), 5);
	EXPECT_NE(adder.Add(56,170), -2);

}

int main(int argc, char **argv)
{
	testing::InitGoogleTest(&argc, argv);
	return RUN_ALL_TESTS();

}


