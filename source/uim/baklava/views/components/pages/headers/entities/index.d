module uim.baklava.views.components.pages.headers.entities.index;

@safe:
import uim.baklava;

class DBKLIndexPageHeaderViewComponent : DBKLPageHeaderViewComponent {
  mixin(BKLViewComponentThis!("BKLIndexPageHeaderViewComponent"));

  override void initialize() {
    super.initialize;
    
    this
      .actions([["refresh", "create"]]); 
  }
}
mixin(BKLViewComponentCalls!("BKLIndexPageHeaderViewComponent", "DBKLIndexPageHeaderViewComponent"));
mixin(BKLViewComponentCalls!("BKLIndexPageHeader", "DBKLIndexPageHeaderViewComponent"));
