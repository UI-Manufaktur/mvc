module uim.baklava.controllers.components.component;

@safe:
import uim.baklava;

class DMVCControllerComponent : DMVCBase, IMVCControllerComponent {
  mixin(MVCControllerComponentThis!("MVCControllerComponent"));

  mixin(OProperty!("IMVCController", "controller"));  

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCControllerComponentCalls!("MVCControllerComponent", "DMVCControllerComponent"));

version(test_uim_mvc) { unittest {
  testMVCControllerComponent(MVCControllerComponent, "MVCControllerComponent");

  assert(MVCControllerComponent.name == "MVCControllerComponent");
  assert(MVCControllerComponent.create.name == "MVCControllerComponent");
  assert(MVCControllerComponent.clone.name == "MVCControllerComponent");
}} 