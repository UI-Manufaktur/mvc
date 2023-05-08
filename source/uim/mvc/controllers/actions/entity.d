/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.actions.entity;

import uim.mvc;
@safe:

class DAPPEntityActionController : DActionController {
  mixin(ControllerThis!("APPEntityActionController"));

  mixin(OProperty!("DEntity", "entity"));
}
mixin(ControllerCalls!("APPEntityActionController"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(new DAPPEntityActionController);

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(APPEntityActionController);
}}