/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.registry;

@safe:
import uim.mvc;

class DMVCViewRegistry : DRegistry!DMVCView{
  this() {}

  static DMVCViewRegistry registry; 
}
auto MVCViewRegistry() { 
  if (!DMVCViewRegistry.registry) {
    DMVCViewRegistry.registry = new DMVCViewRegistry; 
  }
  return 
  DMVCViewRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(MVCViewRegistry.register("mvc/view",  MVCView).paths == ["mvc/view"]);
  assert(MVCViewRegistry.register("mvc/view2", MVCView).paths.length == 2);
}}