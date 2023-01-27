module uim.baklava.views.components.pages.headers.entities.read;

@safe:
import uim.baklava;

class DBKLReadPageHeaderViewComponent : DBKLPageHeaderViewComponent {
  mixin(BKLViewComponentThis!("BKLReadPageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;
  }
}
mixin(BKLViewComponentCalls!("BKLReadPageHeaderViewComponent", "DBKLReadPageHeaderViewComponent"));
mixin(BKLViewComponentCalls!("BKLReadPageHeader", "DBKLReadPageHeaderViewComponent"));
