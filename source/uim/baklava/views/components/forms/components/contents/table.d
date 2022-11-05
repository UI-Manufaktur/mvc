module uim.baklava.views.components.forms.components.contents.table;

@safe:
import uim.baklava;

class DBLVTableFormContent : DBLVEntitiesViewComponent {
  mixin(BLVViewComponentThis!("BLVTableFormContent"));

  mixin(OProperty!("DBLVViewComponent", "row"));

  override void initialize() {
    debugMethodCall(moduleName!DBLVTableFormContent~"::DBLVTableFormContent("~this.name~"):initialize");   
    super.initialize;
  }
}
mixin(BLVViewComponentCalls!("BLVTableFormContent", "DBLVTableFormContent"));

version(test_uim_apps) { unittest {
  assert(BLVTableFormContent);
}}