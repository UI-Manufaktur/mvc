module uim.mvc.views.components.pages.headers.entities.list;

@safe:
import uim.mvc;

class DMVCListPageHeader : DPageHeader {
  mixin(MVCViewComponentThis!("MVCListPageHeader"));
}
mixin(MVCViewComponentCalls!("MVCListPageHeader"));
