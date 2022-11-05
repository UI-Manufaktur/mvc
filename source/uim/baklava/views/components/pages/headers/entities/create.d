module uim.baklava.views.components.pages.headers.entities.create;

@safe:
import uim.baklava;

class DBLVCreatePageHeaderViewComponent : DBLVPageHeaderViewComponent {
  mixin(BLVViewComponentThis!("BLVCreatePageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;
    
    this
      .actions([["refresh"], ["list"]]); 
  }
}
mixin(BLVViewComponentCalls!("BLVCreatePageHeaderViewComponent", "DBLVCreatePageHeaderViewComponent"));
mixin(BLVViewComponentCalls!("BLVCreatePageHeader", "DBLVCreatePageHeaderViewComponent"));
