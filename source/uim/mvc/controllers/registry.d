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

unittest {
  writeln(MVCControllerRegistry.register("mvc/controller", MVCController).paths);
  writeln(MVCControllerRegistry.register("mvc/controller2", MVCController).paths);
}