/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.exceptions.missingcomponent;

@safe:
import uim.mvc;

// Used when a component cannot be found.
class DMissingComponentException : UIMException {
	override void initialize(Json configSetting = Json(null)) {
		super.initialize;
  	this.messageTemplate("Component class %s could not be found.");
	}
}
auto MissingComponentException() { return new DMissingComponentException; }
