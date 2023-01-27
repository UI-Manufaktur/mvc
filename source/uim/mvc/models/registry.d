module uim.mvc.models.registry;

@safe:
import uim.mvc;

class DMVCModelRegistry : DRegistry!DMVCModel{
  this() {}

  static DMVCModelRegistry registry; 
}
auto BKLModelRegistry() { 
  if (!DMVCModelRegistry.registry) {
    DMVCModelRegistry.registry = new DMVCModelRegistry; 
  }
  return 
  DMVCModelRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BKLModelRegistry.register("mvc/model",  BKLModel).paths == ["mvc/model"]);
  assert(BKLModelRegistry.register("mvc/model2", BKLModel).paths.length == 2);
}}