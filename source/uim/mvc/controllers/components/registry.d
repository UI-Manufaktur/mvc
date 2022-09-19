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

unittest {
  writeln(MVCControllerComponentRegistry.register("mvc/controllercomponent", MVCControllerComponent).paths);
  writeln(MVCControllerComponentRegistry.register("mvc/controllercomponent2", MVCControllerComponent).paths);
}