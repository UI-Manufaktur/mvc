/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.internalsessions.session;

import uim.mvc;
@safe:

class DSessionHasHTTPSessionCheck : DSessionExistsCheck {
  mixin(ControllerComponentThis!("SessionHasHTTPSessionCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .redirectUrl("/login");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DSessionHasHTTPSessionCheck~":DSessionHasHTTPSessionCheck::execute");
    if (!super.execute(options)) { return false; }

    auto session = sessionManager.session(options).session;
    if (!session) { // session missing 
      this.error("internalsession_session_missing");
      return false; 
    }

    return true;
  }
}
mixin(ControllerComponentCalls!("SessionHasHTTPSessionCheck"));
