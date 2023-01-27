module uim.mvc.views.components.pages.headers.entities.create;

@safe:
import uim.mvc;

class DMVCCreatePageHeaderViewComponent : DMVCPageHeaderViewComponent {
  mixin(BKLViewComponentThis!("BKLCreatePageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;
    
    this
      .actions([["refresh"], ["list"]]); 
  }
}
mixin(BKLViewComponentCalls!("BKLCreatePageHeaderViewComponent", "DMVCCreatePageHeaderViewComponent"));
mixin(BKLViewComponentCalls!("BKLCreatePageHeader", "DMVCCreatePageHeaderViewComponent"));
