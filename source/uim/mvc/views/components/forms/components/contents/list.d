module uim.mvc.views.components.forms.components.contents.list;

@safe:
import uim.mvc;

class DMVCListFormContent : DMVCEntitiesViewComponent {
  mixin(MVCViewComponentThis!("MVCListFormContent"));

  mixin(OProperty!("DMVCEntityViewComponent", "templateListItem"));

  override void initialize() {
    debugMethodCall(moduleName!DMVCListFormContent~"::DMVCListFormContent("~this.name~"):initialize");   
    super.initialize;
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
mixin(MVCViewComponentCalls!("MVCListFormContent", "DMVCListFormContent"));

version(test_uim_apps) { unittest {
  assert(MVCListFormContent);
}}