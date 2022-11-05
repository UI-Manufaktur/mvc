module uim.mvc.views.components.tables.filter;

@safe:
import uim.mvc;

class DMVCEntitiesTableFilter : DMVCViewComponent {
  this() { super(); this.visibleEntities(10); }
  this(DMVCView myView) { this().view(myView); }

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
auto MVCEntitiesTableFilter() { return new DMVCEntitiesTableFilter; }

version(test_uim_apps) { unittest {
  assert(MVCEntitiesTableFilter);
}}