module uim.mvc.views.components.pages.headers.entities.list;

@safe:
import uim.mvc;

class DMVCListPageHeaderViewComponent : DMVCPageHeaderViewComponent {
  mixin(MVCViewComponentThis!("MVCListPageHeaderViewComponent"));
}
mixin(MVCViewComponentCalls!("MVCListPageHeaderViewComponent", "DMVCListPageHeaderViewComponent"));
