/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.applications.registry;

import uim.mvc;

@safe:
class DApplicationRegistry : DRegistry!DApplication {
  this() {}  

  static DApplicationRegistry registry; 
}
auto ApplicationRegistry() { 
  if (!DApplicationRegistry.registry) {
    DApplicationRegistry.registry = new DApplicationRegistry; 
  }
  return 
    DApplicationRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(ApplicationRegistry.register("mvc/test",  Application).paths == ["mvc/test"]);
  assert(ApplicationRegistry.register("mvc/test2", Application).paths.length == 2);
}}
