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

unittest {
  writeln(MVCViewRegistry.register("mvc/view", MVCView).paths);
  writeln(MVCViewRegistry.register("mvc/view2", MVCView).paths);
}