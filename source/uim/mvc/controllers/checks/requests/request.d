/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.requests.request;

@safe:
import uim.mvc;

class DRequestExistsCheck : DControllerCheck {
  mixin(ControllerComponentThis!("RequestExistsCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=request_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DRequestExistsCheck~":DRequestExistsCheck::check");
    if (!super.execute(options)) { return false; }

    if (!this.controller || !this.controller.request) { // Request missing 
      this
        .error("No Request found");
      return false;
    }

    return true;
  }
}
mixin(ControllerComponentCalls!("RequestExistsCheck"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DRequestExistsCheck);
    assert(RequestExistsCheck);
    assert(new DRequestExistsCheck(Controller));
    assert(RequestExistsCheck(Controller));
  }
}
