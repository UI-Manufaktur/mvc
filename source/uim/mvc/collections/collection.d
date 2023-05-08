/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.collections.collection;

import uim.mvc;
@safe:

class DCollection {
  this() { initialize; }

  void initialize() {
    // 
  }
}
auto Collection() { return new DCollection; }

version(test_uim_mvc) { unittest {
  assert(Collection);
}}