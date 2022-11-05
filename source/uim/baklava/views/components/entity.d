module uim.baklava.views.components.entity;

@safe:
import uim.baklava;

class DMVCEntityViewComponent : DMVCViewComponent {
  mixin(MVCViewComponentThis!("MVCEntityViewComponent"));

  // mixin(OProperty!("DOOPEntity", "entity"));
  mixin(OProperty!("CRUDModes", "crudMode"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCEntityViewComponent~":DMVCEntityViewComponent("~this.name~")::beforeH5");
    super.beforeH5(options);
  }
}
mixin(MVCViewComponentCalls!("MVCEntityViewComponent", "DMVCEntityViewComponent"));
