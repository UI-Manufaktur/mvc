module uim.mvc.views.components.null_;

@safe:
import uim.mvc;

class DMVCNullComponent : DMVCViewComponent {
  mixin(ViewComponentThis!("MVCNullComponent"));
  
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
mixin(ViewComponentCalls!("MVCNullComponent"));

version(test_uim_apps) { unittest {
  assert(MVCNullComponent);
}}