module uim.baklava.views.components.registry;

@safe:
import uim.baklava;

class DBLVViewComponentRegistry : DRegistry!DBLVViewComponent{
  this() {}

  static DBLVViewComponentRegistry registry; 
}
auto BLVViewComponentRegistry() { 
  if (!DBLVViewComponentRegistry.registry) {
    DBLVViewComponentRegistry.registry = new DBLVViewComponentRegistry; 
  }
  return 
   DBLVViewComponentRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BLVViewComponentRegistry.register("mvc/viewcomponent",  BLVViewComponent).paths == ["mvc/viewcomponent"]);
  assert(BLVViewComponentRegistry.register("mvc/viewcomponent2", BLVViewComponent).paths.length == 2);
}}