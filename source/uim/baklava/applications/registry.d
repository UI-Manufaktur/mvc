module uim.baklava.applications.registry;

@safe:
import uim.baklava;

class DBLVApplicationRegistry : DRegistry!DBLVApplication {
  this() {}  

  static DBLVApplicationRegistry registry; 
}
auto BLVApplicationRegistry() { 
  if (!DBLVApplicationRegistry.registry) {
    DBLVApplicationRegistry.registry = new DBLVApplicationRegistry; 
  }
  return 
    DBLVApplicationRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BLVApplicationRegistry.register("mvc/test",  BLVApplication).paths == ["mvc/test"]);
  assert(BLVApplicationRegistry.register("mvc/test2", BLVApplication).paths.length == 2);
}}
