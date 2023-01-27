module uim.mvc.views.components.pages.headers.entities.delete_;

@safe:
import uim.mvc;

class DMVCDeletePageHeaderViewComponent : DMVCPageHeaderViewComponent {
  mixin(MVCViewComponentThis!("MVCDeletePageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;

    this
      .actions([["refresh"], ["list"], ["view", "edit"], ["print", "export"]]); 
  }
}
mixin(MVCViewComponentCalls!("MVCDeletePageHeaderViewComponent", "DMVCDeletePageHeaderViewComponent"));
mixin(MVCViewComponentCalls!("MVCDeletePageHeader", "DMVCDeletePageHeaderViewComponent"));
