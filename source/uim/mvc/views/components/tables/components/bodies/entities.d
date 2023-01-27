module uim.baklava.views.components.tables.components.bodies.entities;

@safe:
import uim.baklava;

class DBKLEntitiesTableBody : DBKLTableBody {
  mixin(BKLViewComponentThis!("BKLEntitiesTableBody"));
}
mixin(BKLViewComponentCalls!("BKLEntitiesTableBody", "DBKLEntitiesTableBody"));
