module uim.baklava.views.components.tables.components.bodies.entity;

@safe:
import uim.baklava;

class DBKLEntityTableBody : DBKLTableBody {
  mixin(BKLViewComponentThis!("BKLEntityTableBody"));
}
mixin(BKLViewComponentCalls!("BKLEntityTableBody", "DBKLEntityTableBody"));
