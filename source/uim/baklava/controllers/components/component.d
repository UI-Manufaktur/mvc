module uim.baklava.controllers.components.component;

@safe:
import uim.baklava;

class DBKLControllerComponent : DBKLBase, IBKLControllerComponent {
  mixin(BKLControllerComponentThis!("BKLControllerComponent"));

  mixin(OProperty!("IBKLController", "controller"));  

  override void initialize() {
    super.initialize;
  }
}
mixin(BKLControllerComponentCalls!("BKLControllerComponent", "DBKLControllerComponent"));

version(test_uim_mvc) { unittest {
  testBKLControllerComponent(BKLControllerComponent, "BKLControllerComponent");

  assert(BKLControllerComponent.name == "BKLControllerComponent");
  assert(BKLControllerComponent.create.name == "BKLControllerComponent");
  assert(BKLControllerComponent.clone.name == "BKLControllerComponent");
}} 