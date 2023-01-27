module uim.mvc.views.components.tables.components.component;

@safe:
import uim.mvc;

class DBKLTableComponent : DBKLEntitiesViewComponent {
  mixin(BKLViewComponentThis!("BKLTableComponent"));

  mixin(OProperty!("DBKLTableViewComponent", "table"));
}
mixin(BKLViewComponentCalls!("BKLTableComponent", "DBKLTableComponent"));
