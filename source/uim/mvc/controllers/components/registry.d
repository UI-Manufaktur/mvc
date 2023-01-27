module uim.mvc.controllers.components.registry;

@safe:
import uim.mvc;

class DControllerComponentRegistry : DRegistry!DControllerComponent{
  this() {}

  static DControllerComponentRegistry registry; 
}
auto ControllerComponentRegistry() { 
  if (!DControllerComponentRegistry.registry) {
    DControllerComponentRegistry.registry = new DControllerComponentRegistry; 
  }
  return 
  DControllerComponentRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(ControllerComponentRegistry.register("mvc/controllercomponent",  ControllerComponent).paths == ["mvc/controllercomponent"]);
  assert(ControllerComponentRegistry.register("mvc/controllercomponent2", ControllerComponent).paths.length == 2);
}}