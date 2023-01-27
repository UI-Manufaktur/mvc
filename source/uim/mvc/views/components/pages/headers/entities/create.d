module uim.baklava.views.components.pages.headers.entities.create;

@safe:
import uim.baklava;

class DBKLCreatePageHeaderViewComponent : DBKLPageHeaderViewComponent {
  mixin(BKLViewComponentThis!("BKLCreatePageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;
    
    this
      .actions([["refresh"], ["list"]]); 
  }
}
mixin(BKLViewComponentCalls!("BKLCreatePageHeaderViewComponent", "DBKLCreatePageHeaderViewComponent"));
mixin(BKLViewComponentCalls!("BKLCreatePageHeader", "DBKLCreatePageHeaderViewComponent"));
