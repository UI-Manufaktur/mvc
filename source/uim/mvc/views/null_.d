module uim.mvc.views.null_;

import uim.mvc;
@safe:

class DNullView : DView {
  mixin(ViewThis!("NullView"));

  override bool isNull() {
    return true;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    return null;
  }

  override string render(STRINGAA options = null) {
    return null;
  }
}
mixin(ViewCalls!("NullView"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(NullView.name == "NullView");
    assert(NullView.name("newView").name == "newView");
}}
