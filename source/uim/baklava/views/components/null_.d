module uim.baklava.views.components.null_;

@safe:
import uim.baklava;

class DBKLNullComponent : DBKLViewComponent {
  mixin(ViewComponentThis!("BKLNullComponent"));
  
  override void initialize() {
    super.initialize(); 

    this
    .isNull(true) 
    .notNull(false); 
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
      return null;        
  }

  override string render(STRINGAA options = null) {
    return null; 
  }
}
mixin(ViewComponentCalls!("BKLNullComponent"));

version(test_uim_apps) { unittest {
  assert(BKLNullComponent);
}}