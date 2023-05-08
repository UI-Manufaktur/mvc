/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.layouts.registry;

import uim.mvc;
@safe:

class DLayoutRegistry : DRegistry!DLayout{
  this() {}

  static DLayoutRegistry registry; 
}
auto LayoutRegistry() { // Singleton
  if (!DLayoutRegistry.registry) {
    DLayoutRegistry.registry = new DLayoutRegistry; 
  }
  return 
    DLayoutRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(LayoutRegistry.register("mvc/layout",  Layout).paths == ["mvc/layout"]);
  assert(LayoutRegistry.register("mvc/layout2", Layout).paths.length == 2);
}}