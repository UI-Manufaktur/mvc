/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.exceptions.missingcomponent;

@safe:
import uim.mvc;

// Used when a component cannot be found.
class DMissingComponentException : DUIMException {
	override void initialize(Json configSettings = Json(null)) {
		super.initialize(configSettings);
  	
		this
			.messageTemplate("Component class %s could not be found.");
	}
}
auto MissingComponentException() { return new DMissingComponentException; }
