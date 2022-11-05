module uim.baklava.views.components.pages.headers.entities.index;

@safe:
import uim.baklava;

class DBLVIndexPageHeaderViewComponent : DBLVPageHeaderViewComponent {
  mixin(BLVViewComponentThis!("BLVIndexPageHeaderViewComponent"));

  override void initialize() {
    super.initialize;
    
    this
      .actions([["refresh", "create"]]); 
  }
}
mixin(BLVViewComponentCalls!("BLVIndexPageHeaderViewComponent", "DBLVIndexPageHeaderViewComponent"));
mixin(BLVViewComponentCalls!("BLVIndexPageHeader", "DBLVIndexPageHeaderViewComponent"));
