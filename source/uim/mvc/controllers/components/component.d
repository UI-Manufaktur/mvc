module uim.mvc.controllers.components.component;

@safe:
import uim.mvc;

class DMVCControllerComponent : DMVCBase, IMVCControllerComponent {
  mixin(MVCControllerComponentThis!("MVCControllerComponent"));

  mixin(OProperty!("IMVCController", "controller"));  

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCControllerComponentCalls!("MVCControllerComponent", "DMVCControllerComponent"));

version(test_uim_mvc) unittest {
  testMVCControllerComponent(MVCControllerComponent, "MVCControllerComponent");
}