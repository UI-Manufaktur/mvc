module uim.mvc.views.components.registry;

@safe:
import uim.mvc;

class DMVCViewComponentRegistry : DRegistry!DMVCViewComponent{
  this() {}

  static DMVCViewComponentRegistry registry; 
}
auto MVCViewComponentRegistry() { 
  if (!DMVCViewComponentRegistry.registry) {
    DMVCViewComponentRegistry.registry = new DMVCViewComponentRegistry; 
  }
  return 
   DMVCViewComponentRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(MVCViewComponentRegistry.register("mvc/viewcomponent",  MVCViewComponent).paths == ["mvc/viewcomponent"]);
  assert(MVCViewComponentRegistry.register("mvc/viewcomponent2", MVCViewComponent).paths.length == 2);
}}