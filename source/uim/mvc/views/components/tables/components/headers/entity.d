module uim.mvc.views.components.tables.components.headers.entity;

@safe:
import uim.mvc;

class DMVCEntityTableHeader : DMVCTableHeader {
  mixin(MVCViewComponentThis!("MVCEntityTableHeader"));
}
mixin(MVCViewComponentCalls!("MVCEntityTableHeader", "DMVCEntityTableHeader"));
