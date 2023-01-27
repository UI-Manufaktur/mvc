module uim.mvc.views.components.pages.headers.entities.index;

@safe:
import uim.mvc;

class DMVCIndexPageHeaderViewComponent : DMVCPageHeaderViewComponent {
  mixin(BKLViewComponentThis!("BKLIndexPageHeaderViewComponent"));

  override void initialize() {
    super.initialize;
    
    this
      .actions([["refresh", "create"]]); 
  }
}
mixin(BKLViewComponentCalls!("BKLIndexPageHeaderViewComponent", "DMVCIndexPageHeaderViewComponent"));
mixin(BKLViewComponentCalls!("BKLIndexPageHeader", "DMVCIndexPageHeaderViewComponent"));
