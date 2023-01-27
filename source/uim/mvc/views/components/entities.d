module uim.mvc.views.components.entities;

@safe:
import uim.mvc;

class DMVCEntitiesViewComponent : DMVCViewComponent {
  mixin(BKLViewComponentThis!("BKLEntitiesViewComponent"));

  // mixin(OProperty!("DOOPEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCEntitiesViewComponent~":DMVCEntitiesViewComponent("~this.name~")::beforeH5");
    super.beforeH5(options);
  }
}
mixin(BKLViewComponentCalls!("BKLEntitiesViewComponent", "DMVCEntitiesViewComponent"));
