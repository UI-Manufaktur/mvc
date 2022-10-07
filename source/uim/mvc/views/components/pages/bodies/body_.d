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
        H5Div(id, ["page-body d-print-none mb-3"], 
        )
      ].toH5;
  }
}
mixin(MVCViewComponentCalls!("MVCPageBodyViewComponent", "DMVCPageBodyViewComponent"));
