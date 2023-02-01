module uim.mvc.views.components.pages.headers.entities.read;

@safe:
import uim.mvc;

class DMVCReadPageHeaderViewComponent : DMVCPageHeaderViewComponent {
  mixin(ViewComponentThis!("MVCReadPageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;
  }
}
mixin(ViewComponentCalls!("MVCReadPageHeaderViewComponent", "DMVCReadPageHeaderViewComponent"));
mixin(ViewComponentCalls!("MVCReadPageHeader", "DMVCReadPageHeaderViewComponent"));
