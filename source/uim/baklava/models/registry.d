module uim.baklava.models.registry;

@safe:
import uim.baklava;

class DBLVModelRegistry : DRegistry!DBLVModel{
  this() {}

  static DBLVModelRegistry registry; 
}
auto BLVModelRegistry() { 
  if (!DBLVModelRegistry.registry) {
    DBLVModelRegistry.registry = new DBLVModelRegistry; 
  }
  return 
  DBLVModelRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BLVModelRegistry.register("mvc/model",  BLVModel).paths == ["mvc/model"]);
  assert(BLVModelRegistry.register("mvc/model2", BLVModel).paths.length == 2);
}}