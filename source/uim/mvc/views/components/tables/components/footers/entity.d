module uim.mvc.views.components.tables.components.footers.entity;

@safe:
import uim.mvc;

class DMVCEntityTableFooter : DMVCTableFooter {
  mixin(MVCViewComponentThis!("MVCEntityTableFooter"));
}
mixin(MVCViewComponentCalls!("MVCEntityTableFooter", "DMVCEntityTableFooter"));
