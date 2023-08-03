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
module uim.mvc.controllers.checks.sessions.hassession;

import uim.mvc;

@safe:
class DSessionExistsCheck : DControllerCheck {
  mixin(ControllerComponentThis!("SessionExistsCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .redirectUrl("/login")
      .checks(HasHTTPSessionCheck);
  }

  override bool execute(STRINGAA options = null) {    
    debug writeln(moduleName!DSessionExistsCheck~":DSessionExistsCheck::check");
    if (!super.execute(options)) { return false; }

    if (!manager) { 
      debug writeln("manager missing");
      this.exception(ManagerMissingException([className]));
      return false; 
    }

    if (!manager.hasSession(manager.request.session.id) || !manager.hasSession(options)) { // sessionId unknown 
      debug writeln("sessionId missing");
      this.exception(SessionMissingException([className]));
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
