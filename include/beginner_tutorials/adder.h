/*
 * adder.h
 *
 *  Created on: Jul 18, 2019
 *      Author: kukauser
 */

#ifndef BEGINNER_TUTORIALS_INCLUDE_BEGINNER_TUTORIALS_ADDER_H_
#define BEGINNER_TUTORIALS_INCLUDE_BEGINNER_TUTORIALS_ADDER_H_
#include <stdio.h>
#include <string>
#include <functional>

using std::string;

class Adder
{
private:
  int64_t call_count = 0;
  string id = "default ID";
  std::function<void(const int&)> NumberOfCallsCallback = [](const int&) {};

public:
  Adder();

  Adder(string id);

  int64_t Add(int64_t a, int64_t b);

  string GetID();

  void AddHandler(std::function<void(const int&)> handler);
  // void (*NumberOfCallsCallback)(int64_t &call_count_out);
};

#endif /* BEGINNER_TUTORIALS_INCLUDE_BEGINNER_TUTORIALS_ADDER_H_ */
