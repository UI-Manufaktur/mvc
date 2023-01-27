/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.applications.registry;

@safe:
import uim.mvc;

class DMVCApplicationRegistry : DRegistry!DMVCApplication {
  this() {}  

  static DMVCApplicationRegistry registry; 
}
auto MVCApplicationRegistry() { 
  if (!DMVCApplicationRegistry.registry) {
    DMVCApplicationRegistry.registry = new DMVCApplicationRegistry; 
  }
  return 
    DMVCApplicationRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(MVCApplicationRegistry.register("mvc/test",  MVCApplication).paths == ["mvc/test"]);
  assert(MVCApplicationRegistry.register("mvc/test2", MVCApplication).paths.length == 2);
}}
