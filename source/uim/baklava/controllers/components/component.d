module uim.baklava.controllers.components.component;

@safe:
import uim.baklava;

class DBLVControllerComponent : DBLVBase, IBLVControllerComponent {
  mixin(BLVControllerComponentThis!("BLVControllerComponent"));

  mixin(OProperty!("IBLVController", "controller"));  

  override void initialize() {
    super.initialize;
  }
}
mixin(BLVControllerComponentCalls!("BLVControllerComponent", "DBLVControllerComponent"));

version(test_uim_mvc) { unittest {
  testBLVControllerComponent(BLVControllerComponent, "BLVControllerComponent");

  assert(BLVControllerComponent.name == "BLVControllerComponent");
  assert(BLVControllerComponent.create.name == "BLVControllerComponent");
  assert(BLVControllerComponent.clone.name == "BLVControllerComponent");
}} 