/*
 * adder.cpp
 *
 *  Created on: Jul 18, 2019
 *      Author: kukauser
 */

#include "beginner_tutorials/adder.h"

Adder::Adder()
{
  // NumberOfCallsCallback = [](int64_t &dummy) {};
}

Adder::Adder(string id) : Adder()
{
  this->id = id;
}

int64_t Adder::Add(int64_t a, int64_t b)
{
  call_count++;
  NumberOfCallsCallback(call_count);
  return static_cast<int64_t>(a) + static_cast<int64_t>(b);
}

string Adder::GetID()
{
  char *name = (char*) alloca(10);
  free(name);
  char *name2 = "name";
  free(name2);
  return id;
}

void Adder::AddHandler(std::function<void(const int&)> handler)
{
  NumberOfCallsCallback = handler;
}
