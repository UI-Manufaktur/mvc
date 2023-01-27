module uim.mvc.views.components.tables.components.headers.entity;

@safe:
import uim.mvc;

class DBKLEntityTableHeader : DBKLTableHeader {
  mixin(BKLViewComponentThis!("BKLEntityTableHeader"));
}
mixin(BKLViewComponentCalls!("BKLEntityTableHeader", "DBKLEntityTableHeader"));
