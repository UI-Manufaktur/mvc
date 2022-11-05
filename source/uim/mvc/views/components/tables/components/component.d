module uim.mvc.views.components.tables.components.component;

@safe:
import uim.mvc;

class DMVCTableComponent : DEntitiesViewComponent {
  mixin(ViewComponentThis!("MVCTableComponent"));

  mixin(OProperty!("DMVCTableViewComponent", "table"));
}
mixin(ViewComponentCalls!("MVCTableComponent"));
