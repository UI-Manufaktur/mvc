module uim.baklava.routes.route;

@safe:
import uim.baklava;

class DBKLRoute : DBKLBase, IBKLRoute {
  this() { super(); }
  this(string aPath, HTTPMethod aMethod, DBKLController aController) {
    this().path(aPath).method(aMethod).controller(aController);
  }

  override void initialize() {
    super.initialize;
  }

  mixin(OProperty!("string", "path"));
  mixin(OProperty!("HTTPMethod", "method"));
  mixin(OProperty!("DBKLController", "controller"));
}
auto BKLRoute() { return new DBKLRoute; }
auto BKLRoute(string aPath, HTTPMethod aMethod, DBKLController aController) { return new DBKLRoute(aPath, aMethod, aController); }

version(test_uim_mvc) { unittest { 
  assert(BKLRoute);
  assert(BKLRoute("testPath", HTTPMethod.GET, BKLController));
  assert(BKLRoute("testPath", HTTPMethod.GET, BKLActionController));
  assert(BKLRoute("testPath", HTTPMethod.GET, BKLPageController));
}} 
