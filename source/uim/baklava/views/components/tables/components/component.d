module uim.baklava.views.components.tables.components.component;

@safe:
import uim.baklava;

class DMVCTableComponent : DEntitiesViewComponent {
  mixin(ViewComponentThis!("MVCTableComponent"));

  mixin(OProperty!("DMVCTableViewComponent", "table"));
}
mixin(ViewComponentCalls!("MVCTableComponent"));
