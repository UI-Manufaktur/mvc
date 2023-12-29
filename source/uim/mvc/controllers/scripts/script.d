/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.scripts.script;

import uim.mvc;

@safe:
class DScript : DController {
  this() { initialize; }
  /* this(IApplication myApp) { this().app(myApp); } */

  // Initialization (= hook method)
override void initialize(Json[string] configSettings = null) {
    super.initialize(configSettings);

    this.name = "Script"; 
    this.mimetype("text/css");
  }
} 
auto Script() { return new DScript; }
/* auto Script(IApplication myApp) { return new DScript(myApp); } */