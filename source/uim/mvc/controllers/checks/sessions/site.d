/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.sessions.site;

import uim.mvc;
@safe:

class DSessionHasSiteCheck : DSessionExistsCheck {
  mixin(ControllerComponentThis!("SessionHasSiteCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DSessionHasSiteCheck~":DSessionHasSiteCheck::check");
    if (!super.execute(options)) { return false; }

    auto mySession = manager.session(options);
    auto site = mySession.site;
    if (!site) { 
      this.error("internalsession_site_missing");
      return false; 
    }

    debug writeln(moduleName!DSessionHasSiteCheck~":DSessionHasSiteCheck::check -> session.site found -> ", site.id);
    return true;
  }
}
mixin(ControllerComponentCalls!("SessionHasSiteCheck"));
