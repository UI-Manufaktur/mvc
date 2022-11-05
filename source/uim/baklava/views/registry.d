module uim.baklava.views.registry;

@safe:
import uim.baklava;

class DBLVViewRegistry : DRegistry!DBLVView{
  this() {}

  static DBLVViewRegistry registry; 
}
auto BLVViewRegistry() { 
  if (!DBLVViewRegistry.registry) {
    DBLVViewRegistry.registry = new DBLVViewRegistry; 
  }
  return 
  DBLVViewRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BLVViewRegistry.register("mvc/view",  BLVView).paths == ["mvc/view"]);
  assert(BLVViewRegistry.register("mvc/view2", BLVView).paths.length == 2);
}}