module uim.mvc.views.components.pages.headers.entities.edit;

@safe:
import uim.mvc;

class DMVCEditPageHeaderViewComponent : DMVCPageHeaderViewComponent {
  mixin(MVCViewComponentThis!("MVCEditPageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;

    this
      .actions([["refresh"], ["list"], ["view"], ["print", "export"]]); 
  }
}
mixin(MVCViewComponentCalls!("MVCEditPageHeaderViewComponent", "DMVCEditPageHeaderViewComponent"));
mixin(MVCViewComponentCalls!("MVCEditPageHeader", "DMVCEditPageHeaderViewComponent"));
