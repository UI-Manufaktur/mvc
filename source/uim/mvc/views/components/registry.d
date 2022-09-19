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

unittest {
  writeln(MVCViewComponentRegistry.register("mvc/viewcomponent", MVCViewComponent).paths);
  writeln(MVCViewComponentRegistry.register("mvc/viewcomponent2", MVCViewComponent).paths);
}