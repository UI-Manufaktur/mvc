module uim.mvc.views.components.pages.headers.entities.read;

@safe:
import uim.mvc;

class DMVCReadPageHeaderViewComponent : DMVCPageHeaderViewComponent {
  mixin(ViewComponentThis!("MVCReadPageHeaderViewComponent"));
  
  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
  }
}
mixin(ViewComponentCalls!("MVCReadPageHeaderViewComponent", "DMVCReadPageHeaderViewComponent"));
mixin(ViewComponentCalls!("MVCReadPageHeader", "DMVCReadPageHeaderViewComponent"));
