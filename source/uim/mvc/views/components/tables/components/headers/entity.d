module uim.mvc.views.components.tables.components.headers.entity;

@safe:
import uim.mvc;

class DMVCEntityTableHeader : DTableHeader {
  mixin(ViewComponentThis!("MVCEntityTableHeader"));
}
mixin(ViewComponentCalls!("MVCEntityTableHeader", "DMVCEntityTableHeader"));
