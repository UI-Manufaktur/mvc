module uim.baklava.views.login2;

@safe:
import uim.baklava;

class DBKLLogin2View : DBKLView {
  mixin(BKLViewThis!("BKLLogin2View"));

  override void beforeH5(STRINGAA options = null) { 
    debugMethodCall(moduleName!DBKLLogin2View~":DBKLLogin2View::beforeH5");
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
        BS5Row("form", BKLLogin2Form.toH5(options)))
    ].toH5;
  }
}
mixin(BKLViewCalls!("BKLLogin2View", "DBKLLogin2View"));

version(test_baklava) { unittest {
  assert(BKLLogin2View);
}}