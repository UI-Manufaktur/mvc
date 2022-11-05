module uim.baklava.views.components.pages.headers.entities.read;

@safe:
import uim.baklava;

class DMVCReadPageHeaderViewComponent : DMVCPageHeaderViewComponent {
  mixin(MVCViewComponentThis!("MVCReadPageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;
  }
}
mixin(MVCViewComponentCalls!("MVCReadPageHeaderViewComponent", "DMVCReadPageHeaderViewComponent"));
mixin(MVCViewComponentCalls!("MVCReadPageHeader", "DMVCReadPageHeaderViewComponent"));
