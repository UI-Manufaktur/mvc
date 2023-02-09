/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.components.contents.table;

@safe:
import uim.mvc;

class DTableFormContent : DMVCEntitiesViewComponent {
  mixin(ViewComponentThis!("MVCTableFormContent"));

  mixin(OProperty!("DViewComponent", "row"));

  override void initialize(Json configSetting = Json(null)) {
    debugMethodCall(moduleName!DTableFormContent~"::DTableFormContent("~this.name~"):initialize");   
    super.initialize(configSettings);
  }
}
mixin(ViewComponentCalls!("MVCTableFormContent", "DTableFormContent"));

version(test_uim_mvc) { unittest {
  assert(MVCTableFormContent);
}}