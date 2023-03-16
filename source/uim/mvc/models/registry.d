/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.models.registry;

@safe:
import uim.mvc;

class DModelRegistry : DRegistry!DModel{
  this() {}

  static DModelRegistry registry; 
}
auto ModelRegistry() { 
  if (!DModelRegistry.registry) {
    DModelRegistry.registry = new DModelRegistry; 
  }
  return 
  DModelRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(ModelRegistry.register("mvc/model",  Model).paths == ["mvc/model"]);
  assert(ModelRegistry.register("mvc/model2", Model).paths.length == 2);
}}