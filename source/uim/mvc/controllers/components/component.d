module uim.mvc.controllers.components.component;

@safe:
import uim.mvc;

class DMVCControllerComponent : DMVCBase, IMVCControllerComponent {
  mixin(MVCControllerComponentThis!("MVCControllerComponent"));

  override void initialize() {}
}
mixin(MVCControllerComponentCalls!("MVCControllerComponent", "DMVCControllerComponent"));

version(test_uim_mvc) unittest {
  assert(MVCControllerComponent.name == "MVCControllerComponent");
  assert(cast(DMVCControllerComponent)MVCControllerComponent);
  assert(cast(IMVCControllerComponent)MVCControllerComponent);
}