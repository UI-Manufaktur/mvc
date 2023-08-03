/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.sessions.login;

import uim.mvc;

@safe:
class DSessionHasLoginCheck : DSessionExistsCheck {
  mixin(ControllerComponentThis!("SessionHasLoginCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .redirectUrl("/login")
      .checks(SessionExistsCheck);
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DSessionHasLoginCheck~":DSessionHasLoginCheck::check");
    if (!super.execute(options)) { return false; }

    if (!manager) { 
      debug writeln("manager missing");
      this.exception(ManagerMissingException([className]));
      return false; 
    }

/*     auto login = manager.session(options);
    if (!login) { // login missing 
      this.error("internalsession_login_missing");
      return false; 
    }
 */
    debug writeln(moduleName!DSessionHasLoginCheck~":DSessionHasLoginCheck::check -> session.login found -> ", login.id);
    return true;
  }
}
mixin(ControllerComponentCalls!("SessionHasLoginCheck"));
