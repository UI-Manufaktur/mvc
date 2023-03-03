/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.requests.accountname;

@safe:
import uim.mvc;

class DRequestHasAccountNameCheck : DDatabaseHasAccountsCheck {
  mixin(ControllerComponentThis!("RequestHasAccountNameCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login");
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!RequestHasAccountNameCheck~":RequestHasAccountNameCheck::execute");
    if (!super.execute(options)) { return false; }

    if ("accountName" !in options) { // Account  missing
      this.error("request_accountname_missing");
      return false; 
    }

    debug writeln("accountName = ", options["accountName"]);
    return true;
  }
}
mixin(ControllerComponentCalls!("RequestHasAccountNameCheck"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DRequestHasAccountNameCheck);
    assert(RequestHasAccountNameCheck);
    assert(new DRequestHasAccountNameCheck(Controller));
    assert(RequestHasAccountNameCheck(Controller));
  }
}
