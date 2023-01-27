module uim.mvc.routes.route;

@safe:
import uim.mvc;

class DMVCRoute : DMVCBase, IMVCRoute {
  this() { super(); }
  this(string aPath, HTTPMethod aMethod, DController aController) {
    this().path(aPath).method(aMethod).controller(aController);
  }

  override void initialize() {
    super.initialize;
  }

  mixin(OProperty!("string", "path"));
  mixin(OProperty!("HTTPMethod", "method"));
  mixin(OProperty!("DController", "controller"));
}
auto MVCRoute() { return new DMVCRoute; }
auto MVCRoute(string aPath, HTTPMethod aMethod, DController aController) { return new DMVCRoute(aPath, aMethod, aController); }

version(test_uim_mvc) { unittest { 
  assert(MVCRoute);
  assert(MVCRoute("testPath", HTTPMethod.GET, Controller));
  assert(MVCRoute("testPath", HTTPMethod.GET, MVCActionController));
  assert(MVCRoute("testPath", HTTPMethod.GET, MVCPageController));
}} 
