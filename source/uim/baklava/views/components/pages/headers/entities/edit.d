module uim.baklava.views.components.pages.headers.entities.edit;

@safe:
import uim.baklava;

class DBLVEditPageHeaderViewComponent : DBLVPageHeaderViewComponent {
  mixin(BLVViewComponentThis!("BLVEditPageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;

    this
      .actions([["refresh"], ["list"], ["view"], ["print", "export"]]); 
  }
}
mixin(BLVViewComponentCalls!("BLVEditPageHeaderViewComponent", "DBLVEditPageHeaderViewComponent"));
mixin(BLVViewComponentCalls!("BLVEditPageHeader", "DBLVEditPageHeaderViewComponent"));
