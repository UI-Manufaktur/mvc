module uim.baklava.views.components.entity;

@safe:
import uim.baklava;

class DBLVEntityViewComponent : DBLVViewComponent {
  mixin(BLVViewComponentThis!("BLVEntityViewComponent"));

  // mixin(OProperty!("DOOPEntity", "entity"));
  mixin(OProperty!("CRUDModes", "crudMode"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DBLVEntityViewComponent~":DBLVEntityViewComponent("~this.name~")::beforeH5");
    super.beforeH5(options);
  }
}
mixin(BLVViewComponentCalls!("BLVEntityViewComponent", "DBLVEntityViewComponent"));
