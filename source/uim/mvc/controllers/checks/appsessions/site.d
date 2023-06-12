/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.internalsessions.site;

import uim.mvc;
@safe:

class DInternalSessionHasSiteCheck : DInternalSessionExistsCheck {
  mixin(ControllerComponentThis!("InternalSessionHasSiteCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DInternalSessionHasSiteCheck~":DInternalSessionHasSiteCheck::check");
    if (!super.execute(options)) { return false; }

    auto site = getInternalSession(options).site;
    if (!site) { 
      this.error("internalsession_site_missing");
      return false; 
    }

    debug writeln(moduleName!DInternalSessionHasSiteCheck~":DInternalSessionHasSiteCheck::check -> session.site found -> ", site.id);
    return true;
  }
}
mixin(ControllerComponentCalls!("InternalSessionHasSiteCheck"));
