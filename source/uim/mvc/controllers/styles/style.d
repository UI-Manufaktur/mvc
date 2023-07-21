module uim.mvc.controllers.styles.style;

import uim.mvc;

@safe:
class DStyle : DController {
  this() { initialize; }
  /* this(DApplication myApp) { this().app(myApp); } */

  // Initialization (= hook method)
override void initialize(Json configSettings = null) {
    super.initialize(configSettings);
    super.initialize;

    this.name = "Style"; 
    this.mimetype("application/javastyle"); 
  }
} 
auto Style() { return new DStyle; }
/* auto Style(DApplication myApp) { return new DStyle(myApp); } */