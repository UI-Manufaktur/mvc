module uim.mvc.controllers.components.component;

@safe:
import uim.mvc;

class DMVCControllerComponent : DMVCBase, IMVCControllerComponent {
  mixin(MVCControllerComponentThis!("MVCControllerComponent"));

  mixin(OProperty!("DMVCController", "controller"));  

  override void initialize() {}
}
mixin(MVCControllerComponentCalls!("MVCControllerComponent", "DMVCControllerComponent"));

version(test_uim_mvc) unittest {
  testMVCControllerComponent(MVCControllerComponent, "MVCControllerComponent");
}