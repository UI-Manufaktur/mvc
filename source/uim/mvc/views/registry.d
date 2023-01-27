module uim.mvc.views.registry;

@safe:
import uim.mvc;

class DMVCViewRegistry : DRegistry!DMVCView{
  this() {}

  static DMVCViewRegistry registry; 
}
auto MVCViewRegistry() { 
  if (!DMVCViewRegistry.registry) {
    DMVCViewRegistry.registry = new DMVCViewRegistry; 
  }
  return 
  DMVCViewRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(MVCViewRegistry.register("mvc/view",  MVCView).paths == ["mvc/view"]);
  assert(MVCViewRegistry.register("mvc/view2", MVCView).paths.length == 2);
}}