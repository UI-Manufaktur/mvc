module uim.mvc.controllers.scripts.script;

@safe:
import uim.mvc;

class DAPPScript : DController {
  this() { initialize; }
  this(DMVCApplication myApp) { this().app(myApp); }

  // Initialization (= hook method)
override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;

    this.name = "APPScript"; 
    this.mimetype("text/css");
  }
} 
auto APPScript() { return new DAPPScript; }
auto APPScript(DMVCApplication myApp) { return new DAPPScript(myApp); }