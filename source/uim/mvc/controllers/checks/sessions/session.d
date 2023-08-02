/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.sessions.session;

import uim.mvc;

@safe:
class DSessionExistsCheck : DControllerCheck {
  mixin(ControllerComponentThis!("SessionExistsCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .redirectUrl("/account");
  }

  override bool execute(STRINGAA options = null) {    
    debug writeln(moduleName!DSessionExistsCheck~":DSessionExistsCheck::check");

    if (!manager) debug writeln("Manager missing");

    if (auto mySession = manager.session(options)) {
      return true;
    } else { // internalsession missing 
      this.error("internalsession_missing");
      return false; 
    }
  }
}
mixin(ControllerComponentCalls!("SessionExistsCheck"));

///
unittest {
  auto check = new DSessionExistsCheck;
  assert(check.name == "SessionExistsCheck");
}
