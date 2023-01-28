module uim.mvc.views.components.tables.components.footers.footer;

@safe:
import uim.mvc;

class DTableFooter : DTableComponent {
  mixin(MVCViewComponentThis!("MVCTableFooter"));
}
mixin(MVCViewComponentCalls!("MVCTableFooter", "DTableFooter"));
