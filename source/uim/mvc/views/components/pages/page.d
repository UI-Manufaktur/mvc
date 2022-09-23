module uim.mvc.views.components.pages.page;

@safe:
import uim.mvc;

class DMVCPageViewComponent
 : DMVCViewComponent {
  mixin(MVCViewComponentThis!("MVCPageViewComponent"));
  
  mixin(OProperty!("DMVCPageHeaderViewComponent", "header"));
  mixin(OProperty!("DMVCViewComponent", "content"));
  mixin(OProperty!("DMVCPageFooterViewComponent", "footer"));
}
mixin(MVCViewComponentCalls!("MVCPageViewComponent", "DMVCPageViewComponent"));
