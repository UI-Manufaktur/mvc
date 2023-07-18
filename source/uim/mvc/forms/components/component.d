/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.components.component;

import uim.mvc;

@safe:
class DFormComponent : DViewComponent {
  mixin(ViewComponentThis!("FormComponent"));

  override void initialize(Json configSettings = Json(null)) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DFormComponent~"::DFormComponent("~this.className~"):initialize"); }
    super.initialize(configSettings);

    // debugwriteln("In ", __MODULE__, "/", __LINE__);
  }

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("DForm", "form"));
  mixin(OProperty!("bool", "readonly")); 
  mixin(MVCParameter!("title"));  
  // mixin(MVCParameter!("rootPath"));  
}
mixin(ViewComponentCalls!("FormComponent", "DFormComponent"));

version(test_uim_mvc) { unittest {
  assert(FormComponent);
}}