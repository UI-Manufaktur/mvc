/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.components.registry;

import uim.mvc;
@safe:

class DControllerComponentRegistry : DRegistry!DControllerComponent{
  this() {}

  static DControllerComponentRegistry registry; 
}
auto ControllerComponentRegistry() { 
  if (!DControllerComponentRegistry.registry) {
    DControllerComponentRegistry.registry = new DControllerComponentRegistry; 
  }
  return 
  DControllerComponentRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(ControllerComponentRegistry.register("mvc/controllercomponent",  ControllerComponent).paths == ["mvc/controllercomponent"]);
  assert(ControllerComponentRegistry.register("mvc/controllercomponent2", ControllerComponent).paths.length == 2);
}}