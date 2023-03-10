/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.requests.accountid;

@safe:
import uim.mvc;

class DRequestHasAccountIdCheck : DDatabaseHasAccountsCheck {
  mixin(ControllerComponentThis!("RequestHasAccountIdCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login");
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!RequestHasAccountIdCheck~"::execute");
    if (!super.execute(options)) { return false; }

    if ("accountId" !in options) { // Account  missing
      this.error("request_accountid_missing");
      return false; 
    }

    debug writeln("accountId = ", options["accountId"]);
    return true;
  }
}
mixin(ControllerComponentCalls!("RequestHasAccountIdCheck"));
