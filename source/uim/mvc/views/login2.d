module uim.mvc.views.login2;

@safe:
import uim.mvc;

class DMVCLogin2View : DView {
  mixin(ViewThis!("MVCLogin2View"));

  override void beforeH5(STRINGAA options = null) { 
    debugMethodCall(moduleName!DMVCLogin2View~":DMVCLogin2View::beforeH5");
    super.beforeH5(options);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);

    return [
      H5Div(["container-tight py-4"], 
        BS5Row("messages", ["mt-2 mb-2"]),
        BS5Row("logo", ["text-center"],  
          H5A(["href":"https://www.sicherheitsschmiede.de"], 
            H5Img(["src":"/img/logo.png", "height":"80", "alt":"Sicherheitsschmiede - Sicher im Internet"]))),
        BS5Row("form", MVCLogin2Form.toH5(options)))
    ].toH5;
  }
}
mixin(ViewCalls!("MVCLogin2View", "DMVCLogin2View"));

version(test_uim_mvc) { unittest {
  assert(MVCLogin2View);
}}