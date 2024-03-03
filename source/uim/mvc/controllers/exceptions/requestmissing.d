/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.exceptions.requestmissing;

import uim.mvc;
@safe:

class DRequestMissingException : DException {
	mixin(ExceptionThis!("RequestMissingException"));

	override bool initialize(IData[string] configSettings = null) {
		super.initialize(configSettings);

    this
      .message("Request is missing");
  }
}
mixin(ExceptionCalls!("RequestMissingException"));

