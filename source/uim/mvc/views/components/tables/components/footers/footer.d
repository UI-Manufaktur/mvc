module uim.mvc.views.components.tables.components.footers.footer;

@safe:
import uim.mvc;

class DBKLTableFooter : DBKLTableComponent {
  mixin(BKLViewComponentThis!("BKLTableFooter"));
}
mixin(BKLViewComponentCalls!("BKLTableFooter", "DBKLTableFooter"));
