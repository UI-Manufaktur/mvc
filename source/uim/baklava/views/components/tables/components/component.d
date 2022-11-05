module uim.baklava.views.components.tables.components.component;

@safe:
import uim.baklava;

class DBKLTableComponent : DEntitiesViewComponent {
  mixin(ViewComponentThis!("BKLTableComponent"));

  mixin(OProperty!("DBKLTableViewComponent", "table"));
}
mixin(ViewComponentCalls!("BKLTableComponent"));
