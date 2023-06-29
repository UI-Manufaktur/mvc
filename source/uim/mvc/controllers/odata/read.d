/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.odata.read;

import uim.mvc;

@safe:
class DReadRestController : DController {
  mixin(ControllerThis!("ReadRestController"));
}
mixin(ControllerCalls!("ReadRestController"));

version(test_uim_mvc) { unittest {
  writeln("--- Tests in ", __MODULE__, "/", __LINE__);
  testPageController(new DReadRestController); 

  writeln("--- Tests in ", __MODULE__, "/", __LINE__);
  testPageController(ReadRestController); 
}}