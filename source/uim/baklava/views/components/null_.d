module uim.baklava.views.components.null_;

@safe:
import uim.baklava;

class DBLVNullComponent : DBLVViewComponent {
  mixin(ViewComponentThis!("BLVNullComponent"));
  
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
mixin(ViewComponentCalls!("BLVNullComponent"));

version(test_uim_apps) { unittest {
  assert(BLVNullComponent);
}}