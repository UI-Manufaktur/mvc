module uim.mvc.views.components.tables.components.bodies.entity;

@safe:
import uim.mvc;

class DBKLEntityTableBody : DBKLTableBody {
  mixin(BKLViewComponentThis!("BKLEntityTableBody"));
}
mixin(BKLViewComponentCalls!("BKLEntityTableBody", "DBKLEntityTableBody"));
