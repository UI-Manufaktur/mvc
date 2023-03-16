/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.helpers.registry;

@safe:
import uim.mvc;

class DHelperRegistry {
  this() { initialize; }

    void initialize() {
    // 
  }
}
auto HelperRegistry() { return new DHelperRegistry; }

version(test_uim_mvc) { unittest {
  assert(HelperRegistry);
}}