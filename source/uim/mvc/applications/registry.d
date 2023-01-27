module uim.baklava.applications.registry;

@safe:
import uim.baklava;

class DBKLApplicationRegistry : DRegistry!DBKLApplication {
  this() {}  

  static DBKLApplicationRegistry registry; 
}
auto BKLApplicationRegistry() { 
  if (!DBKLApplicationRegistry.registry) {
    DBKLApplicationRegistry.registry = new DBKLApplicationRegistry; 
  }
  return 
    DBKLApplicationRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BKLApplicationRegistry.register("mvc/test",  BKLApplication).paths == ["mvc/test"]);
  assert(BKLApplicationRegistry.register("mvc/test2", BKLApplication).paths.length == 2);
}}
