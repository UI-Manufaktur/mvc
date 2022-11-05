module uim.baklava.views.components.pages.bodies.body_;

@safe:
import uim.baklava;

class DBKLPageBodyViewComponent : DBKLViewComponent {
  mixin(BKLViewComponentThis!("BKLPageBodyViewComponent"));

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
mixin(BKLViewComponentCalls!("BKLPageBodyViewComponent", "DBKLPageBodyViewComponent"));
mixin(BKLViewComponentCalls!("BKLPageBody", "DBKLPageBodyViewComponent"));
