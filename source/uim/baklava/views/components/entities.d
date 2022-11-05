module uim.baklava.views.components.entities;

@safe:
import uim.baklava;

class DMVCEntitiesViewComponent : DMVCViewComponent {
  mixin(MVCViewComponentThis!("MVCEntitiesViewComponent"));

  // mixin(OProperty!("DOOPEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCEntitiesViewComponent~":DMVCEntitiesViewComponent("~this.name~")::beforeH5");
    super.beforeH5(options);
  }
}
mixin(MVCViewComponentCalls!("MVCEntitiesViewComponent", "DMVCEntitiesViewComponent"));
