module uim.baklava.views.components.forms.components.contents.list;

@safe:
import uim.baklava;

class DBLVListFormContent : DBLVEntitiesViewComponent {
  mixin(BLVViewComponentThis!("BLVListFormContent"));

  mixin(OProperty!("DBLVEntityViewComponent", "templateListItem"));

  override void initialize() {
    debugMethodCall(moduleName!DBLVListFormContent~"::DBLVListFormContent("~this.name~"):initialize");   
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DBLVEntitiesFormContent~"DBLVEntitiesFormContent::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    debug writeln("Found entities for table = ", entities.length);

    DH5Obj[] listItems = this.entities.map!(entity => entity ? templateListItem.entity(entity).toH5 : null).join; 
      
    return [
      BS5ListGroup(["list-group-flush"], listItems)
    ].toH5;
  } 
}
mixin(BLVViewComponentCalls!("BLVListFormContent", "DBLVListFormContent"));

version(test_uim_apps) { unittest {
  assert(BLVListFormContent);
}}