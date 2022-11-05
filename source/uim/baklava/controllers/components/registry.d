module uim.baklava.controllers.components.registry;

@safe:
import uim.baklava;

class DBLVControllerComponentRegistry : DRegistry!DBLVControllerComponent{
  this() {}

  static DBLVControllerComponentRegistry registry; 
}
auto BLVControllerComponentRegistry() { 
  if (!DBLVControllerComponentRegistry.registry) {
    DBLVControllerComponentRegistry.registry = new DBLVControllerComponentRegistry; 
  }
  return 
  DBLVControllerComponentRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BLVControllerComponentRegistry.register("mvc/controllercomponent",  BLVControllerComponent).paths == ["mvc/controllercomponent"]);
  assert(BLVControllerComponentRegistry.register("mvc/controllercomponent2", BLVControllerComponent).paths.length == 2);
}}