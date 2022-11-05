module uim.baklava.controllers.registry;

@safe:
import uim.baklava;

class DBLVControllerRegistry : DRegistry!DBLVController{
  this() {}

  static DBLVControllerRegistry registry; 
}
auto BLVControllerRegistry() { 
  if (!DBLVControllerRegistry.registry) {
    DBLVControllerRegistry.registry = new DBLVControllerRegistry; 
  }
  return 
    DBLVControllerRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BLVControllerRegistry.register("mvc/controllercomponent",  BLVController).paths == ["mvc/controllercomponent"]);
  assert(BLVControllerRegistry.register("mvc/controllercomponent2", BLVController).paths.length == 2);
}}