/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.appsessions.session;

@safe:
import uim.mvc;

class DAppSessionHasSessionCheck : DAppSessionExistsCheck {
  mixin(ControllerComponentThis!("AppSessionHasSessionCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAppSessionHasSessionCheck~":DAppSessionHasSessionCheck::execute");
    if (!super.execute(options)) { return false; }

    auto session = getAppSession(options).session;
    if (!session) { // session missing 
      this.error("appsession_session_missing");
      return false; 
    }

    return true;
  }
}
mixin(ControllerComponentCalls!("AppSessionHasSessionCheck"));
