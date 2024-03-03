/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.sessions.hashttpsession;

import uim.mvc;

@safe:
class DHasHTTPSessionCheck : DControllerCheck {
  mixin(ControllerComponentThis!("HasHTTPSessionCheck"));

  override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);

    this
      .redirectUrl("/login");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DHasHTTPSessionCheck~":DHasHTTPSessionCheck::execute");
    if (!super.execute(options)) { 
      return false; 
    }

    if (!manager) { 
      debug writeln("manager missing");
      this.exception(ManagerMissingException([className]));
      return false; 
    }

    if (!manager.request) { 
      debug writeln("request missing");
      this.exception(RequestMissingException([className]));
      return false; 
    }

    if (!manager.request.session) { // session missing 
      debug writeln("session missing");
      this.exception(SessionMissingException([className]));
      return false; 
    }

    options["httpSessionId"] = manager.request.session.id;
    return true;
  }
}
mixin(ControllerComponentCalls!("HasHTTPSessionCheck"));
