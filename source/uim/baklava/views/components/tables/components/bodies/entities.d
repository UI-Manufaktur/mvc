module uim.baklava.views.components.tables.components.bodies.entities;

@safe:
import uim.baklava;

class DBKLEntitiesTableBody : DBKLTableBody {
  mixin(ViewComponentThis!("BKLEntitiesTableBody"));
}
mixin(ViewComponentCalls!("BKLEntitiesTableBody", "DBKLEntitiesTableBody"));
