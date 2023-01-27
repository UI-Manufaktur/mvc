module uim.baklava.views.registry;

@safe:
import uim.baklava;

class DBKLViewRegistry : DRegistry!DBKLView{
  this() {}

  static DBKLViewRegistry registry; 
}
auto BKLViewRegistry() { 
  if (!DBKLViewRegistry.registry) {
    DBKLViewRegistry.registry = new DBKLViewRegistry; 
  }
  return 
  DBKLViewRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(BKLViewRegistry.register("mvc/view",  BKLView).paths == ["mvc/view"]);
  assert(BKLViewRegistry.register("mvc/view2", BKLView).paths.length == 2);
}}