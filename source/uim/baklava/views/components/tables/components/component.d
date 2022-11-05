module uim.baklava.views.components.tables.components.component;

@safe:
import uim.baklava;

class DBLVTableComponent : DEntitiesViewComponent {
  mixin(ViewComponentThis!("BLVTableComponent"));

  mixin(OProperty!("DBLVTableViewComponent", "table"));
}
mixin(ViewComponentCalls!("BLVTableComponent"));
