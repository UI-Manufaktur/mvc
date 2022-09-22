module uim.mvc.views.components.component;

@safe:
import uim.mvc;

class DMVCViewComponent : DMVCBase, IMVCViewComponent {
  mixin(MVCViewComponentThis!("MVCViewComponent"));

  override void initialize() {
    super.initialize;
  }

  mixin(OProperty!("IMVCView", "view"));
}
mixin(MVCViewComponentCalls!("MVCViewComponent", "DMVCViewComponent"));

version(test_uim_mvc) { unittest {
  testMVCViewComponent(MVCViewComponent, "MVCViewComponent");

  assert(MVCViewComponent.name == "MVCViewComponent");
  assert(MVCViewComponent.create.name == "MVCViewComponent");
  assert(MVCViewComponent.clone.name == "MVCViewComponent");
}} 
