module uim.baklava.models.registry;

@safe:
import uim.baklava;

class DBKLModelRegistry : DRegistry!DBKLModel{
  this() {}

  static DBKLModelRegistry registry; 
}
auto BKLModelRegistry() { 
  if (!DBKLModelRegistry.registry) {
    DBKLModelRegistry.registry = new DBKLModelRegistry; 
  }
  return 
  DBKLModelRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BKLModelRegistry.register("mvc/model",  BKLModel).paths == ["mvc/model"]);
  assert(BKLModelRegistry.register("mvc/model2", BKLModel).paths.length == 2);
}}