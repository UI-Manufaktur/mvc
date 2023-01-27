module uim.mvc.applications.registry;

@safe:
import uim.mvc;

class DMVCApplicationRegistry : DRegistry!DMVCApplication {
  this() {}  

  static DMVCApplicationRegistry registry; 
}
auto BKLApplicationRegistry() { 
  if (!DMVCApplicationRegistry.registry) {
    DMVCApplicationRegistry.registry = new DMVCApplicationRegistry; 
  }
  return 
    DMVCApplicationRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BKLApplicationRegistry.register("mvc/test",  BKLApplication).paths == ["mvc/test"]);
  assert(BKLApplicationRegistry.register("mvc/test2", BKLApplication).paths.length == 2);
}}
