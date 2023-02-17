module uim.mvc.views.components.alerts.entity;

@safe:
import uim.mvc;

class DAPPEntityAlertViewComponent : DAPPAlertViewComponent {
  mixin(ViewComponentThis!("APPEntityAlertViewComponent"));
}
mixin(ViewComponentCalls!("APPEntityAlertViewComponent"));