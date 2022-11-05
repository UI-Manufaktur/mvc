module uim.baklava.views.components.pages.bodies.body_;

@safe:
import uim.baklava;

class DBLVPageBodyViewComponent : DBLVViewComponent {
  mixin(BLVViewComponentThis!("BLVPageBodyViewComponent"));

  override void initialize() {
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
     
    return
      [
        UIMPageBody(id, ["mb-3"], 
          UIMCard(
            UIMCardBody(
              // add Content
            )
          )
        )
      ].toH5;
  }
}
mixin(BLVViewComponentCalls!("BLVPageBodyViewComponent", "DBLVPageBodyViewComponent"));
mixin(BLVViewComponentCalls!("BLVPageBody", "DBLVPageBodyViewComponent"));
