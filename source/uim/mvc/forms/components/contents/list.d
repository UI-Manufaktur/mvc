/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.components.contents.list;

import uim.mvc;

@safe:
class DListFormContent : DMVCEntitiesViewComponent {
  mixin(ViewComponentThis!("ListFormContent"));

  mixin(OProperty!("DMVCEntityViewComponent", "templateListItem"));

  override void initialize(Json configSettings = Json(null)) {
    debugMethodCall(moduleName!DListFormContent~"::DListFormContent("~this.className~"):initialize");   
    super.initialize(configSettings);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntitiesFormContent~"DEntitiesFormContent::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    debug writeln("Found entities for table = ", entities.length);

    DH5Obj[] listItems = this.entities.map!(entity => entity ? templateListItem.entity(entity).toH5 : null).join; 
      
    return [
      BS5ListGroup(["list-group-flush"], listItems)
    ].toH5;
  } 
}
mixin(ViewComponentCalls!("ListFormContent", "DListFormContent"));

version(test_uim_mvc) { unittest {
  assert(ListFormContent);
}}