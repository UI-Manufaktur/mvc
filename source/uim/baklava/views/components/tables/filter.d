module uim.baklava.views.components.tables.filter;

@safe:
import uim.baklava;

class DBLVEntitiesTableFilter : DBLVViewComponent {
  this() { super(); this.visibleEntities(10); }
  this(DBLVView myView) { this().view(myView); }

  mixin(OProperty!("size_t", "visibleEntities"));
  
  override DH5Obj[] toH5(STRINGAA options = null) {
    return [
      H5Tr
        .th()
        .th()
        .th()
        .th("filterName")
        .th("filterDisplay")
        .th()];
  }
}
auto BLVEntitiesTableFilter() { return new DBLVEntitiesTableFilter; }

version(test_uim_apps) { unittest {
  assert(BLVEntitiesTableFilter);
}}