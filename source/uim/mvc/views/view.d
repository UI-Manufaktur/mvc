module uim.mvc.views.view;

@safe:
import uim.mvc;

class DMVCView : DMVCBase, IMVCView { 
  mixin(MVCViewThis!("MVCView"));

  override void initialize() {
    super.initialize;
  }
  
  mixin(OProperty!("DMVCController", "controller"));  
}
mixin(MVCViewCalls!("MVCView", "DMVCView"));

version(test_uim_mvc) { unittest { 
  testMVCView(MVCView, "MVCView");
}} 
