module uim.mvc.views.null_;

import uim.mvc;
@safe:

class DAPPNullView : DView {
  mixin(ViewThis!("APPNullView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    return null;
  }

  override string render(STRINGAA options = null) {
    return null;
  }
}
mixin(ViewCalls!("APPNullView"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(APPNullView.name == "APPNullView");
    assert(APPNullView.name("newView").name == "newView");
}}
