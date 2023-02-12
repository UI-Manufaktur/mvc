/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.components.contents.list;

@safe:
import uim.mvc;

class DMVCListFormContent : DMVCEntitiesViewComponent {
  mixin(ViewComponentThis!("MVCListFormContent"));

  mixin(OProperty!("DMVCEntityViewComponent", "templateListItem"));

  override void initialize(DConfigurationValue configSettings = null) {
    debugMethodCall(moduleName!DMVCListFormContent~"::DMVCListFormContent("~this.name~"):initialize");   
    super.initialize(configSettings);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCEntitiesFormContent~"DMVCEntitiesFormContent::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    debug writeln("Found entities for table = ", entities.length);

    DH5Obj[] listItems = this.entities.map!(entity => entity ? templateListItem.entity(entity).toH5 : null).join; 
      
    return [
      BS5ListGroup(["list-group-flush"], listItems)
    ].toH5;
  } 
}
mixin(ViewComponentCalls!("MVCListFormContent", "DMVCListFormContent"));

version(test_uim_mvc) { unittest {
  assert(MVCListFormContent);
}}