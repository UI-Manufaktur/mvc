/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.exceptions.missingaction;

@safe:
import uim.mvc;

/**
 * Missing Action exception - used when a controller action
 * cannot be found, or when the controller"s isAction() method returns false.
 */
class DMissingActionException : UIMException {
	override void initialize(Json configSetting = Json(null)) {
		super.initialize;
		this.messageTemplate("Action %s::%s() could not be found, or is not accessible.");
	}
}
auto MissingActionException() { return new DMissingActionException; }
