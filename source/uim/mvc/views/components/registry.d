/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.registry;

@safe:
import uim.mvc;

class DViewComponentRegistry : DRegistry!DViewComponent{
  this() {}

  static DViewComponentRegistry registry; 
}
auto ViewComponentRegistry() { 
  if (!DViewComponentRegistry.registry) {
    DViewComponentRegistry.registry = new DViewComponentRegistry; 
  }
  return 
   DViewComponentRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(ViewComponentRegistry.register("mvc/viewcomponent",  ViewComponent).paths == ["mvc/viewcomponent"]);
  assert(ViewComponentRegistry.register("mvc/viewcomponent2", ViewComponent).paths.length == 2);
}}