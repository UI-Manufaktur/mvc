module uim.mvc.views.components.tables.components.bodies.entity;

@safe:
import uim.mvc;

class DMVCEntityTableBody : DMVCTableBody {
  mixin(ViewComponentThis!("MVCEntityTableBody"));
}
mixin(ViewComponentCalls!("MVCEntityTableBody"));
