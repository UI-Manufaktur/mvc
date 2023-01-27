module uim.mvc.views.components.entity;

@safe:
import uim.mvc;

class DMVCEntityViewComponent : DMVCViewComponent {
  mixin(BKLViewComponentThis!("BKLEntityViewComponent"));

  // mixin(OProperty!("DOOPEntity", "entity"));
  mixin(OProperty!("CRUDModes", "crudMode"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCEntityViewComponent~":DMVCEntityViewComponent("~this.name~")::beforeH5");
    super.beforeH5(options);
  }
}
mixin(BKLViewComponentCalls!("BKLEntityViewComponent", "DMVCEntityViewComponent"));
