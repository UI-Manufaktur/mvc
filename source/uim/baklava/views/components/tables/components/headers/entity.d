module uim.baklava.views.components.tables.components.headers.entity;

@safe:
import uim.baklava;

class DBKLEntityTableHeader : DBKLTableHeader {
  mixin(BKLViewComponentThis!("BKLEntityTableHeader"));
}
mixin(BKLViewComponentCalls!("BKLEntityTableHeader", "DBKLEntityTableHeader"));
