/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.scripts.script;

@safe:
import uim.mvc;

class DAPPScript : DController {
  this() { initialize; }
  this(DMVCApplication myApp) { this().app(myApp); }

  // Initialization (= hook method)
override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this.name = "APPScript"; 
    this.mimetype("text/css");
  }
} 
auto APPScript() { return new DAPPScript; }
auto APPScript(DMVCApplication myApp) { return new DAPPScript(myApp); }