/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.sessions.siteid;

import uim.mvc;

@safe:
class DSessionHasSiteIdCheck : DHasHTTPSessionCheck {
  mixin(ControllerComponentThis!("SessionHasSiteIdCheck"));

  override void initialize(Json[string] configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DSessionHasSiteIdCheck~":DSessionHasSiteIdCheck::execute");
    if (!super.execute(options)) { 
      return false; 
    }

    auto session = manager.session(options).session;
    if (!session["siteId"]) { // site id in session missing 
      this.error("internalsession_siteid_missing");
      return false; 
    }

    return true;
  }
}
mixin(ControllerComponentCalls!("SessionHasSiteIdCheck"));
