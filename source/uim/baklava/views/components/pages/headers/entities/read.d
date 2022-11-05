module uim.baklava.views.components.pages.headers.entities.read;

@safe:
import uim.baklava;

class DBLVReadPageHeaderViewComponent : DBLVPageHeaderViewComponent {
  mixin(BLVViewComponentThis!("BLVReadPageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;
  }
}
mixin(BLVViewComponentCalls!("BLVReadPageHeaderViewComponent", "DBLVReadPageHeaderViewComponent"));
mixin(BLVViewComponentCalls!("BLVReadPageHeader", "DBLVReadPageHeaderViewComponent"));
