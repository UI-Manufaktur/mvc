module uim.baklava.views.components.tables.listheader;

@safe:
import uim.baklava;

class DBKLListTableHeader : DBKLViewComponent {
  this() { super(); }
  this(DBKLView myView) { this(); this.view(myView); }

  override DH5Obj[] toH5(STRINGAA options) {
    return [
      H5Tr
        .th(["w-1"], `<input id="cbSelectAllEntities" class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select all">`)
        .th("headCreated", ["w-1"], H5String("Erstellt "))
        .th("headChanged", ["w-1"], H5String("Geändert "))
        .th("headName", ["w-1"], ["style":"min-width:100px;"], H5String("Name "), H5Span("nameSort", [""], tablerIcon("arrow-sort")), H5Span("nameUp", ["d-none"], tablerIcon("arrow-up")), H5Span("nameDown", ["d-none"], tablerIcon("arrow-down")))
        .th("headDisplay", [""], 
          H5Span("Titel "), 
          H5Span("displaySort", [""], tablerIcon("arrow-sort")), 
          H5Span("displayUp", ["d-none"], tablerIcon("arrow-up")), H5Span("displayDown", ["d-none"], tablerIcon("arrow-down")))
        .th("headActions", ["w-1"], H5String("Aktionen"))];
  }
}
auto BKLListTableHeader() { return new DBKLListTableHeader; }
auto BKLListTableHeader(DBKLView myView) { return new DBKLListTableHeader(myView); }