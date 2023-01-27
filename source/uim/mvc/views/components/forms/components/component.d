/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.components.component;

@safe:
import uim.mvc;

class DBKLFormComponent : DBKLViewComponent {
  mixin(BKLViewComponentThis!("BKLFormComponent"));

  override void initialize() {
    debugMethodCall(moduleName!DBKLFormComponent~"::DBKLFormComponent("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("DBKLForm", "form"));
  mixin(OProperty!("bool", "readonly")); 
  mixin(BKLParameter!("title"));  
  mixin(BKLParameter!("rootPath"));  
}
mixin(BKLViewComponentCalls!("BKLFormComponent", "DBKLFormComponent"));

version(test_baklava) { unittest {
  assert(BKLFormComponent);
}}