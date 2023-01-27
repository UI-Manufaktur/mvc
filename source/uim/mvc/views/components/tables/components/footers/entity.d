module uim.mvc.views.components.tables.components.footers.entity;

@safe:
import uim.mvc;

class DBKLEntityTableFooter : DBKLTableFooter {
  mixin(BKLViewComponentThis!("BKLEntityTableFooter"));
}
mixin(BKLViewComponentCalls!("BKLEntityTableFooter", "DBKLEntityTableFooter"));
