/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.middlewareoptions;

import uim.mvc;
@safe:

class DControllerMiddlewareOptions {
    // The middleware options.
    protected STRINGAA _options;

    // Create a new middleware option instance.
    this(STRINGAA options) {
        _options = options; }

    // Set the controller methods the middleware should apply to.
    O only(this O)(STRINGAA methods) {
        _options["only"] = methods;
        return cast(O)this; }

    // Set the controller methods the middleware should exclude.
    O except(this O)(STRINGAA methods) {
        _options["except"] = methods;
        return cast(O)this; }
}