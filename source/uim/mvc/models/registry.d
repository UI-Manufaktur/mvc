module uim.mvc.models.registry;

@safe:
import uim.mvc;

class DMVCModelRegistry : DRegistry!DMVCModel{
  this() {}

  static DMVCModelRegistry registry; 
}
auto MVCModelRegistry() { 
  if (!DMVCModelRegistry.registry) {
    DMVCModelRegistry.registry = new DMVCModelRegistry; 
  }
  return 
  DMVCModelRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(MVCModelRegistry.register("mvc/model",  MVCModel).paths == ["mvc/model"]);
  assert(MVCModelRegistry.register("mvc/model2", MVCModel).paths.length == 2);
}}