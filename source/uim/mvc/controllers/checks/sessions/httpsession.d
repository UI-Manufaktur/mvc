/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.sessions.httpsession;

import uim.mvc;

@safe:
class DSessionHasHTTPSessionCheck : DControllerCheck {
  mixin(ControllerComponentThis!("SessionHasHTTPSessionCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .redirectUrl("/login");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DSessionHasHTTPSessionCheck~":DSessionHasHTTPSessionCheck::execute");
    if (!super.execute(options)) { return false; }

    if (!manager) { 
      debug writeln("manager missing");
      this.error("manager_missing");
      return false; 
    }

    if (!manager.request) { 
      debug writeln("request missing");
      this.error("request_missing");
      return false; 
    }

    if (!manager.request.session) { // session missing 
      debug writeln("session missing");
      this.error("session_missing");
      return false; 
    }

    if (!manager.hasSession(manager.request.session.id)) { // sessionId unknown 
      debug writeln("sessionId missing");
      this.error("sessionId_unknown");
      return false; 
    }

    return true;
  }
}
mixin(ControllerComponentCalls!("SessionHasHTTPSessionCheck"));
