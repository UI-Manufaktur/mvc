/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.registry;

import uim.mvc;
@safe:

class DFormRegistry : DRegistry!DForm{
  this() {}

  static DFormRegistry registry; 
}
auto FormRegistry() { 
  if (!DFormRegistry.registry) {
    DFormRegistry.registry = new DFormRegistry; 
  }
  return 
    DFormRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(FormRegistry.register("mvc/form",  Form).paths == ["mvc/form"]);
  assert(FormRegistry.register("mvc/form2", Form).paths.length == 2);
}}