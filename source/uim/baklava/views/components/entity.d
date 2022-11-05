module uim.baklava.views.components.entity;

@safe:
import uim.baklava;

class DBKLEntityViewComponent : DBKLViewComponent {
  mixin(BKLViewComponentThis!("BKLEntityViewComponent"));

  // mixin(OProperty!("DOOPEntity", "entity"));
  mixin(OProperty!("CRUDModes", "crudMode"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DBKLEntityViewComponent~":DBKLEntityViewComponent("~this.name~")::beforeH5");
    super.beforeH5(options);
  }
}
mixin(BKLViewComponentCalls!("BKLEntityViewComponent", "DBKLEntityViewComponent"));
