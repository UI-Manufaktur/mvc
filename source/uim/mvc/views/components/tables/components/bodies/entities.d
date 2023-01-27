module uim.mvc.views.components.tables.components.bodies.entities;

@safe:
import uim.mvc;

class DBKLEntitiesTableBody : DBKLTableBody {
  mixin(BKLViewComponentThis!("BKLEntitiesTableBody"));
}
mixin(BKLViewComponentCalls!("BKLEntitiesTableBody", "DBKLEntitiesTableBody"));
