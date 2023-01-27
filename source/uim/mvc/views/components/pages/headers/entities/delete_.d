module uim.mvc.views.components.pages.headers.entities.delete_;

@safe:
import uim.mvc;

class DMVCDeletePageHeaderViewComponent : DMVCPageHeaderViewComponent {
  mixin(BKLViewComponentThis!("BKLDeletePageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;

    this
      .actions([["refresh"], ["list"], ["view", "edit"], ["print", "export"]]); 
  }
}
mixin(BKLViewComponentCalls!("BKLDeletePageHeaderViewComponent", "DMVCDeletePageHeaderViewComponent"));
mixin(BKLViewComponentCalls!("BKLDeletePageHeader", "DMVCDeletePageHeaderViewComponent"));
