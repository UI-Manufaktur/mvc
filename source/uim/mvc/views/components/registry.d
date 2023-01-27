module uim.mvc.views.components.registry;

@safe:
import uim.mvc;

class DMVCViewComponentRegistry : DRegistry!DMVCViewComponent{
  this() {}

  static DMVCViewComponentRegistry registry; 
}
auto BKLViewComponentRegistry() { 
  if (!DMVCViewComponentRegistry.registry) {
    DMVCViewComponentRegistry.registry = new DMVCViewComponentRegistry; 
  }
  return 
   DMVCViewComponentRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BKLViewComponentRegistry.register("mvc/viewcomponent",  BKLViewComponent).paths == ["mvc/viewcomponent"]);
  assert(BKLViewComponentRegistry.register("mvc/viewcomponent2", BKLViewComponent).paths.length == 2);
}}