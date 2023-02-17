module uim.mvc.views.components.pages.headers.entities.delete_;

@safe:
import uim.mvc;

class DMVCDeletePageHeaderViewComponent : DPageHeaderViewComponent {
  mixin(ViewComponentThis!("MVCDeletePageHeaderViewComponent"));
  
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .actions([["refresh"], ["list"], ["view", "edit"], ["print", "export"]]); 
  }
}
mixin(ViewComponentCalls!("MVCDeletePageHeaderViewComponent", "DMVCDeletePageHeaderViewComponent"));
mixin(ViewComponentCalls!("MVCDeletePageHeader", "DMVCDeletePageHeaderViewComponent"));
