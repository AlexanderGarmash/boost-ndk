#include "boost/scoped_ptr.hpp"
#include <string>
#include <iostream>

int main() {
  {
  boost::scoped_ptr<std::string> 
  p(new std::string("Use scoped_ptr often."));

  // Print the value of the string
  if (p)
    std::cout << *p << '\n';
    
  // Get the size of the string
  size_t i=p->size();

  // Assign a new value to the string
  *p="Acts just like a pointer";
  
  } // p is destroyed here, and deletes the std::string 
}

