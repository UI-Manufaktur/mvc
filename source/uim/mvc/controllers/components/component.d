module uim.mvc.controllers.components.component;

@safe:
import uim.mvc;

class DControllerComponent : DMVCBase, IControllerComponent {
  mixin(ControllerComponentThis!("ControllerComponent"));

  mixin(OProperty!("IController", "controller"));  
  
  // Component registry class used to lazy load components.
  mixin(OProperty!("DControllerComponentRegistry", "registry");

  override void initialize() {
    super.initialize;
  }
}
mixin(ControllerComponentCalls!("ControllerComponent", "DControllerComponent"));

version(test_uim_mvc) { unittest {
  testControllerComponent(ControllerComponent, "ControllerComponent");

  assert(ControllerComponent.name == "ControllerComponent");
  assert(ControllerComponent.create.name == "ControllerComponent");
  assert(ControllerComponent.clone.name == "ControllerComponent");
}} 