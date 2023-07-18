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
module uim.mvc.controllers.actions.action;

import uim.mvc;

@safe:
class DActionController : DController/* , IActionController */ {
  mixin(ControllerThis!("ActionController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings); 
  }

	override bool beforeResponse(STRINGAA options = null) {
    // debugwriteln(moduleName!DCreateActionController~":DCreateActionController::beforeResponse");
    if (!super.beforeResponse(options) || hasError || "redirect" in options) return false; 

		if (!manager) {
			return false;
		}

		return true;
	}
}
mixin(ControllerCalls!("ActionController"));