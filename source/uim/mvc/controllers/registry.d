module uim.mvc.controllers.registry;

@safe:
import uim.mvc;

class DMVCControllerRegistry : DRegistry!DMVCController{
  this() {}

  static DMVCControllerRegistry registry; 
}
auto MVCControllerRegistry() { 
  if (!DMVCControllerRegistry.registry) {
    DMVCControllerRegistry.registry = new DMVCControllerRegistry; 
  }
  return 
    DMVCControllerRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(MVCControllerRegistry.register("mvc/controllercomponent",  MVCController).paths == ["mvc/controllercomponent"]);
  assert(MVCControllerRegistry.register("mvc/controllercomponent2", MVCController).paths.length == 2);
}}