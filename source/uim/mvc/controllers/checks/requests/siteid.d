/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.requests.siteid;

import uim.mvc;

@safe:
class DRequestHasSiteIdCheck : DDatabaseHasAccountsCheck {
  mixin(ControllerComponentThis!("RequestHasSiteIdCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .redirectUrl("/login")
      .addChecks([RequestExistsCheck]);
  }

  override bool execute(STRINGAA options = null) {
    // debugwriteln(moduleName!DRequestHasSiteIdCheck~":DRequestHasSiteIdCheck::execute");
    if (!super.execute(options)) { return false; }

    if ("siteId" !in options) { // siteId  missing
      this.
        error("No SiteId in Request");
      return false; 
    }

    // debugwriteln("SiteId = ", options["siteId"]);
    return true;
  }
}
mixin(ControllerComponentCalls!("RequestHasSiteIdCheck"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DRequestHasSiteIdCheck);
    assert(RequestHasSiteIdCheck);
    assert(new DRequestHasSiteIdCheck(Controller));
    assert(RequestHasSiteIdCheck(Controller));
  }
}