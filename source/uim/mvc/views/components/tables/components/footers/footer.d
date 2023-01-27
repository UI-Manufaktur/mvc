module uim.mvc.views.components.tables.components.footers.footer;

@safe:
import uim.mvc;

class DMVCTableFooter : DMVCTableComponent {
  mixin(MVCViewComponentThis!("MVCTableFooter"));
}
mixin(MVCViewComponentCalls!("MVCTableFooter", "DMVCTableFooter"));
