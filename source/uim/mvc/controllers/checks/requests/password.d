/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.requests.password;

import uim.mvc;

@safe:
class DRequestHasPasswordCheck : DControllerCheck {
  mixin(ControllerComponentThis!("RequestHasPasswordCheck"));

  override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login");
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DRequestHasPasswordCheck~":DRequestHasPasswordCheck::execute");
    super.execute(options);

    if ("loginPW" !in options) { // loginPW  missing
      this.
        error("No loginPW in Request");
      return false; 
    }

    debug writeln("loginPW = ", options["loginPW"]);
    return true;
  }
}
mixin(ControllerComponentCalls!("RequestHasPasswordCheck"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DRequestHasPasswordCheck);
    assert(RequestHasPasswordCheck);
    assert(new DRequestHasPasswordCheck(Controller));
    assert(RequestHasPasswordCheck(Controller));
  }
}
