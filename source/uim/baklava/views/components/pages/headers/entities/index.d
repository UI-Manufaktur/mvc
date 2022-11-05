module uim.baklava.views.components.pages.headers.entities.index;

@safe:
import uim.baklava;

class DMVCIndexPageHeaderViewComponent : DMVCPageHeaderViewComponent {
  mixin(MVCViewComponentThis!("MVCIndexPageHeaderViewComponent"));

  override void initialize() {
    super.initialize;
    
    this
      .actions([["refresh", "create"]]); 
  }
}
mixin(MVCViewComponentCalls!("MVCIndexPageHeaderViewComponent", "DMVCIndexPageHeaderViewComponent"));
mixin(MVCViewComponentCalls!("MVCIndexPageHeader", "DMVCIndexPageHeaderViewComponent"));
