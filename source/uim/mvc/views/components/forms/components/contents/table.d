/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.components.contents.table;

@safe:
import uim.mvc;

class DMVCTableFormContent : DMVCEntitiesViewComponent {
  mixin(BKLViewComponentThis!("BKLTableFormContent"));

  mixin(OProperty!("DMVCViewComponent", "row"));

  override void initialize() {
    debugMethodCall(moduleName!DMVCTableFormContent~"::DMVCTableFormContent("~this.name~"):initialize");   
    super.initialize;
  }
}
mixin(BKLViewComponentCalls!("BKLTableFormContent", "DMVCTableFormContent"));

version(test_baklava) { unittest {
  assert(BKLTableFormContent);
}}