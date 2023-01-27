module uim.baklava.views.components.tables.filter;

@safe:
import uim.baklava;

class DBKLEntitiesTableFilter : DBKLViewComponent {
  this() { super(); this.visibleEntities(10); }
  this(DBKLView myView) { this().view(myView); }

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
auto BKLEntitiesTableFilter() { return new DBKLEntitiesTableFilter; }

version(test_baklava) { unittest {
  assert(BKLEntitiesTableFilter);
}}