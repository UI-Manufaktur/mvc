module uim.baklava.views.components.pages.headers.entities.delete_;

@safe:
import uim.baklava;

class DBLVDeletePageHeaderViewComponent : DBLVPageHeaderViewComponent {
  mixin(BLVViewComponentThis!("BLVDeletePageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;

    this
      .actions([["refresh"], ["list"], ["view", "edit"], ["print", "export"]]); 
  }
}
mixin(BLVViewComponentCalls!("BLVDeletePageHeaderViewComponent", "DBLVDeletePageHeaderViewComponent"));
mixin(BLVViewComponentCalls!("BLVDeletePageHeader", "DBLVDeletePageHeaderViewComponent"));
