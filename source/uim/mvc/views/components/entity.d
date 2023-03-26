module uim.mvc.views.components.entity;

@safe:
import uim.mvc;

class DMVCEntityViewComponent : DViewComponent {
  mixin(ViewComponentThis!("MVCEntityViewComponent"));

  // mixin(OProperty!("DEntity", "entity"));
  mixin(OProperty!("CRUDModes", "crudMode"));

  override void beforeH5(STRINGAA options = null) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DMVCEntityViewComponent~":DMVCEntityViewComponent("~this.name~")::beforeH5"); }
    super.beforeH5(options);
  }
}
mixin(ViewComponentCalls!("MVCEntityViewComponent", "DMVCEntityViewComponent"));
