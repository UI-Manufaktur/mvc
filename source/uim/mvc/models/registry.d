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

unittest {
  writeln(MVCModelRegistry.register("mvc/model", MVCModel).paths);
  writeln(MVCModelRegistry.register("mvc/model2", MVCModel).paths);
}