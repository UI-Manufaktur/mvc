module uim.mvc.views.components.pages.page;

@safe:
import uim.mvc;

class DMVCPageViewComponent
 : DMVCViewComponent {
  mixin(MVCViewComponentThis!("MVCPageViewComponent"));
  
  mixin(OProperty!("DMVCViewComponent", "header"));
  mixin(OProperty!("DMVCViewComponent", "content"));
  mixin(OProperty!("DMVCViewComponent", "footer"));
}
mixin(MVCViewComponentCalls!("MVCPageViewComponent"));
