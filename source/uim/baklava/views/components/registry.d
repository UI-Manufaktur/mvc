module uim.baklava.views.components.registry;

@safe:
import uim.baklava;

class DBKLViewComponentRegistry : DRegistry!DBKLViewComponent{
  this() {}

  static DBKLViewComponentRegistry registry; 
}
auto BKLViewComponentRegistry() { 
  if (!DBKLViewComponentRegistry.registry) {
    DBKLViewComponentRegistry.registry = new DBKLViewComponentRegistry; 
  }
  return 
   DBKLViewComponentRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BKLViewComponentRegistry.register("mvc/viewcomponent",  BKLViewComponent).paths == ["mvc/viewcomponent"]);
  assert(BKLViewComponentRegistry.register("mvc/viewcomponent2", BKLViewComponent).paths.length == 2);
}}