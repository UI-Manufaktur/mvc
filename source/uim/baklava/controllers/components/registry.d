module uim.baklava.controllers.components.registry;

@safe:
import uim.baklava;

class DBKLControllerComponentRegistry : DRegistry!DBKLControllerComponent{
  this() {}

  static DBKLControllerComponentRegistry registry; 
}
auto BKLControllerComponentRegistry() { 
  if (!DBKLControllerComponentRegistry.registry) {
    DBKLControllerComponentRegistry.registry = new DBKLControllerComponentRegistry; 
  }
  return 
  DBKLControllerComponentRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BKLControllerComponentRegistry.register("mvc/controllercomponent",  BKLControllerComponent).paths == ["mvc/controllercomponent"]);
  assert(BKLControllerComponentRegistry.register("mvc/controllercomponent2", BKLControllerComponent).paths.length == 2);
}}