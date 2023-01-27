module uim.mvc.views.components.pages.bodies.body_;

@safe:
import uim.mvc;

class DMVCPageBodyViewComponent : DMVCViewComponent {
  mixin(MVCViewComponentThis!("MVCPageBodyViewComponent"));

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
mixin(MVCViewComponentCalls!("MVCPageBodyViewComponent", "DMVCPageBodyViewComponent"));
mixin(MVCViewComponentCalls!("MVCPageBody", "DMVCPageBodyViewComponent"));
