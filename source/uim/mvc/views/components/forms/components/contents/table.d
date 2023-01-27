module uim.baklava.views.components.forms.components.contents.table;

@safe:
import uim.baklava;

class DBKLTableFormContent : DBKLEntitiesViewComponent {
  mixin(BKLViewComponentThis!("BKLTableFormContent"));

  mixin(OProperty!("DBKLViewComponent", "row"));

  override void initialize() {
    debugMethodCall(moduleName!DBKLTableFormContent~"::DBKLTableFormContent("~this.name~"):initialize");   
    super.initialize;
  }
}
mixin(BKLViewComponentCalls!("BKLTableFormContent", "DBKLTableFormContent"));

version(test_baklava) { unittest {
  assert(BKLTableFormContent);
}}