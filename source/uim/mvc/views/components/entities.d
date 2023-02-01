module uim.mvc.views.components.entities;

@safe:
import uim.mvc;

class DMVCEntitiesViewComponent : DViewComponent {
  mixin(ViewComponentThis!("MVCEntitiesViewComponent"));

  // mixin(OProperty!("DEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCEntitiesViewComponent~":DMVCEntitiesViewComponent("~this.name~")::beforeH5");
    super.beforeH5(options);
  }
}
mixin(ViewComponentCalls!("MVCEntitiesViewComponent", "DMVCEntitiesViewComponent"));
