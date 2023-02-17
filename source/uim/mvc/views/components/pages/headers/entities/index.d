module uim.mvc.views.components.pages.headers.entities.index;

@safe:
import uim.mvc;

class DMVCIndexPageHeaderViewComponent : DPageHeaderViewComponent {
  mixin(ViewComponentThis!("MVCIndexPageHeaderViewComponent"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    
    this
      .actions([["refresh", "create"]]); 
  }
}
mixin(ViewComponentCalls!("MVCIndexPageHeaderViewComponent", "DMVCIndexPageHeaderViewComponent"));
mixin(ViewComponentCalls!("MVCIndexPageHeader", "DMVCIndexPageHeaderViewComponent"));
