/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.tabpanes.specific;

import uim.mvc;

@safe:
class DAPPSpecificPaneViewComponent : DAPPEntityTabpane {
  mixin(ViewComponentThis!("APPSpecificPaneViewComponent"));

override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
  }
}
mixin(ViewComponentCalls!("APPSpecificPaneViewComponent"));

/* lass DAPPPaneSpecific : DAPPPane {
  this() { super(); this.title("Specific"); }
  this(DEntity myEntity) { this(); this.entity(myEntity); }    
  
  override void inner(STRINGAA options = null) {    
    _col = BS5Col(["col-12"], 
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label pt-4"], "Created"),
        BS5Col(["col-2"])));    
  }
}
   */