module uim.mvc.views.view;

@safe:
import uim.mvc;

class DMVCView : DMVCBase, IMVCView { 
  mixin(MVCViewThis!("MVCView"));

  override void initialize() {
    super.initialize;
  }
  
  mixin(OProperty!("IMVCController", "controller"));  

  DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCView~":DMVCView("~this.name~")::toH5");
    return null;
  }
}
mixin(MVCViewCalls!("MVCView", "DMVCView"));

version(test_uim_mvc) { unittest { 
  testMVCView(MVCView, "MVCView");

  assert(MVCView.name == "MVCView");
  assert(MVCView.create.name == "MVCView");
  assert(MVCView.clone.name == "MVCView");
}} 
