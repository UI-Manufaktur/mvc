module uim.mvc.controllers.components.registry;

@safe:
import uim.mvc;

class DMVCControllerComponentRegistry : DRegistry!DMVCControllerComponent{
  this() {}

  static DMVCControllerComponentRegistry registry; 
}
auto BKLControllerComponentRegistry() { 
  if (!DMVCControllerComponentRegistry.registry) {
    DMVCControllerComponentRegistry.registry = new DMVCControllerComponentRegistry; 
  }
  return 
  DMVCControllerComponentRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BKLControllerComponentRegistry.register("mvc/controllercomponent",  BKLControllerComponent).paths == ["mvc/controllercomponent"]);
  assert(BKLControllerComponentRegistry.register("mvc/controllercomponent2", BKLControllerComponent).paths.length == 2);
}}