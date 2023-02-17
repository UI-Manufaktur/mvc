module uim.mvc.views.components.badges.entity;

@safe:
import uim.mvc;

class DAPPEntityBadgeViewComponent : DAPPBadgeViewComponent {
  mixin(ViewComponentThis!("APPEntityBadgeViewComponent"));

}
mixin(ViewComponentCalls!("APPEntityBadgeViewComponent"));