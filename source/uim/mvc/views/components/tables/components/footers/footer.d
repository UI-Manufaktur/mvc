module uim.mvc.views.components.tables.components.footers.footer;

@safe:
import uim.mvc;

class DTableFooter : DTableComponent {
  mixin(ViewComponentThis!("MVCTableFooter"));
}
mixin(ViewComponentCalls!("MVCTableFooter", "DTableFooter"));
