module uim.baklava.views.components.tables.components.component;

@safe:
import uim.baklava;

class DBKLTableComponent : DBKLEntitiesViewComponent {
  mixin(BKLViewComponentThis!("BKLTableComponent"));

  mixin(OProperty!("DBKLTableViewComponent", "table"));
}
mixin(BKLViewComponentCalls!("BKLTableComponent", "DBKLTableComponent"));
