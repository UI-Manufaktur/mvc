module uim.mvc.views.components.pages.headers.entities.create;

@safe:
import uim.mvc;

class DMVCCreatePageHeaderViewComponent : DMVCPageHeaderViewComponent {
  mixin(MVCViewComponentThis!("MVCCreatePageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;
    
    this
      .actions([["refresh"], ["list"]]); 
  }
}
mixin(MVCViewComponentCalls!("MVCCreatePageHeaderViewComponent", "DMVCCreatePageHeaderViewComponent"));
mixin(MVCViewComponentCalls!("MVCCreatePageHeader", "DMVCCreatePageHeaderViewComponent"));
