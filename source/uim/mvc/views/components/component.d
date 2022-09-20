module uim.mvc.views.components.component;

@safe:
import uim.mvc;

class DMVCViewComponent : DMVCBase, IMVCViewComponent {
  mixin(MVCViewComponentThis!("MVCViewComponent"));

  override void initialize() {}

  mixin(OProperty!("DMVCView", "view"));
}
mixin(MVCViewComponentCalls!("MVCViewComponent", "DMVCViewComponent"));

version(test_uim_mvc) unittest {
  testMVCViewComponent(MVCViewComponent, "MVCViewComponent");
}