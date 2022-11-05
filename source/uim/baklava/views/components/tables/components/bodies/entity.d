module uim.baklava.views.components.tables.components.bodies.entity;

@safe:
import uim.baklava;

class DBKLEntityTableBody : DBKLTableBody {
  mixin(ViewComponentThis!("BKLEntityTableBody"));
}
mixin(ViewComponentCalls!("BKLEntityTableBody", "DBKLEntityTableBody"));
