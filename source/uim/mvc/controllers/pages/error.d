/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.error;

import uim.mvc;

@safe:
class DErrorPageController : DPageController {
  mixin(ControllerThis!("ErrorPageController"));
}
mixin(ControllerCalls!("ErrorPageController"));

version(test_uim_mvc) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DErrorPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(ErrorPageController); 
}}