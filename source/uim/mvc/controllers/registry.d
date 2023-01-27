module uim.baklava.controllers.registry;

@safe:
import uim.baklava;

class DBKLControllerRegistry : DRegistry!DBKLController{
  this() {}

  static DBKLControllerRegistry registry; 
}
auto BKLControllerRegistry() { 
  if (!DBKLControllerRegistry.registry) {
    DBKLControllerRegistry.registry = new DBKLControllerRegistry; 
  }
  return 
    DBKLControllerRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BKLControllerRegistry.register("mvc/controllercomponent",  BKLController).paths == ["mvc/controllercomponent"]);
  assert(BKLControllerRegistry.register("mvc/controllercomponent2", BKLController).paths.length == 2);
}}