module uim.mvc.views.components.pages.bodies.body_;

@safe:
import uim.mvc;

class DMVCPageBodyViewComponent : DViewComponent {
  mixin(ViewComponentThis!("MVCPageBodyViewComponent"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
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
mixin(ViewComponentCalls!("MVCPageBodyViewComponent", "DMVCPageBodyViewComponent"));
mixin(ViewComponentCalls!("MVCPageBody", "DMVCPageBodyViewComponent"));
