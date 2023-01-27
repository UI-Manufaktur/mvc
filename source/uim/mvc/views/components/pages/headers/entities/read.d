module uim.mvc.views.components.pages.headers.entities.read;

@safe:
import uim.mvc;

class DMVCReadPageHeaderViewComponent : DMVCPageHeaderViewComponent {
  mixin(BKLViewComponentThis!("BKLReadPageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;
  }
}
mixin(BKLViewComponentCalls!("BKLReadPageHeaderViewComponent", "DMVCReadPageHeaderViewComponent"));
mixin(BKLViewComponentCalls!("BKLReadPageHeader", "DMVCReadPageHeaderViewComponent"));
