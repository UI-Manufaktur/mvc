module uim.mvc.views.components.pages.headers.entities.delete_;

@safe:
import uim.mvc;

class DBKLDeletePageHeaderViewComponent : DBKLPageHeaderViewComponent {
  mixin(BKLViewComponentThis!("BKLDeletePageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;

    this
      .actions([["refresh"], ["list"], ["view", "edit"], ["print", "export"]]); 
  }
}
mixin(BKLViewComponentCalls!("BKLDeletePageHeaderViewComponent", "DBKLDeletePageHeaderViewComponent"));
mixin(BKLViewComponentCalls!("BKLDeletePageHeader", "DBKLDeletePageHeaderViewComponent"));
