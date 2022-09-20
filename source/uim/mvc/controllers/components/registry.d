module uim.mvc.controllers.components.registry;

@safe:
import uim.mvc;

class DMVCControllerComponentRegistry : DRegistry!DMVCControllerComponent{
  this() {}

  static DMVCControllerComponentRegistry registry; 
}
auto MVCControllerComponentRegistry() { 
  if (!DMVCControllerComponentRegistry.registry) {
    DMVCControllerComponentRegistry.registry = new DMVCControllerComponentRegistry; 
  }
  return 
  DMVCControllerComponentRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(MVCControllerComponentRegistry.register("mvc/controllercomponent",  MVCControllerComponent).paths == ["mvc/controllercomponent"]);
  assert(MVCControllerComponentRegistry.register("mvc/controllercomponent2", MVCControllerComponent).paths.length == 2);
}}