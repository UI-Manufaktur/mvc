/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.exceptions.missingaction;

import uim.mvc;
@safe:

/**
 * Missing Action exception - used when a controller action
 * cannot be found, or when the controller"s isAction() method returns false.
 */
class DMissingActionException : DException {
  mixin(ExceptionThis!("MissingActionException"));

	override bool initialize(IData[string] configSettings = null) {
		super.initialize(configSettings);
		this
			.messageTemplate("Action %s::%s() could not be found, or is not accessible.");
	}
}
mixin(ExceptionCalls!("MissingActionException"));
