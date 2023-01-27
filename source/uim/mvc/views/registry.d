module uim.mvc.views.registry;

@safe:
import uim.mvc;

class DMVCViewRegistry : DRegistry!DMVCView{
  this() {}

  static DMVCViewRegistry registry; 
}
auto BKLViewRegistry() { 
  if (!DMVCViewRegistry.registry) {
    DMVCViewRegistry.registry = new DMVCViewRegistry; 
  }
  return 
  DMVCViewRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BKLViewRegistry.register("mvc/view",  BKLView).paths == ["mvc/view"]);
  assert(BKLViewRegistry.register("mvc/view2", BKLView).paths.length == 2);
}}