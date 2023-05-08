/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.scripts.script;

import uim.mvc;
@safe:

class DAPPScript : DController {
  this() { initialize; }
  this(IApplication myApp) { this().app(myApp); }

  // Initialization (= hook method)
override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.name = "APPScript"; 
    this.mimetype("text/css");
  }
} 
auto APPScript() { return new DAPPScript; }
auto APPScript(IApplication myApp) { return new DAPPScript(myApp); }