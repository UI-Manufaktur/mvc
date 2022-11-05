module uim.baklava.views.components.null_;

@safe:
import uim.baklava;

class DBKLNullComponent : DBKLViewComponent {
  mixin(BKLViewComponentThis!("BKLNullComponent"));
  
  override void initialize() {
    super.initialize(); 

/*     this */
/*     .isNull(true)  */
/*     .notNull(false);  */
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    return null;        
  }

  override string render(STRINGAA options = null) {
    return null; 
  }
}
mixin(BKLViewComponentCalls!("BKLNullComponent", "DBKLNullComponent"));

version(test_baklava) { unittest {
  assert(BKLNullComponent);
}}