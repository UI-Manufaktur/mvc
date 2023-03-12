module uim.mvc.controllers.styles.style;

@safe:
import uim.mvc;

class DAPPStyle : DController {
  this() { initialize; }
  this(DApplication myApp) { this().app(myApp); }

  // Initialization (= hook method)
override void initialize(Json configSettings = null) {
    super.initialize(configSettings);
    super.initialize;

    this.name = "APPStyle"; 
    this.mimetype("application/javastyle"); 
  }
} 
auto APPStyle() { return new DAPPStyle; }
auto APPStyle(DApplication myApp) { return new DAPPStyle(myApp); }