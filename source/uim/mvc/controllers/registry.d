module uim.mvc.controllers.registry;

@safe:
import uim.mvc;

class DMVCControllerRegistry : DRegistry!DMVCController{
  this() {}

  static DMVCControllerRegistry registry; 
}
auto BKLControllerRegistry() { 
  if (!DMVCControllerRegistry.registry) {
    DMVCControllerRegistry.registry = new DMVCControllerRegistry; 
  }
  return 
    DMVCControllerRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BKLControllerRegistry.register("mvc/controllercomponent",  BKLController).paths == ["mvc/controllercomponent"]);
  assert(BKLControllerRegistry.register("mvc/controllercomponent2", BKLController).paths.length == 2);
}}