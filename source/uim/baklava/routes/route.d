module uim.baklava.routes.route;

@safe:
import uim.baklava;

class DBLVRoute : DBLVBase, IBLVRoute {
  this() { super(); }
  this(string aPath, HTTPMethod aMethod, DBLVController aController) {
    this().path(aPath).method(aMethod).controller(aController);
  }

  override void initialize() {
    super.initialize;
  }

  mixin(OProperty!("string", "path"));
  mixin(OProperty!("HTTPMethod", "method"));
  mixin(OProperty!("DBLVController", "controller"));
}
auto BLVRoute() { return new DBLVRoute; }
auto BLVRoute(string aPath, HTTPMethod aMethod, DBLVController aController) { return new DBLVRoute(aPath, aMethod, aController); }

version(test_uim_mvc) { unittest { 
  assert(BLVRoute);
  assert(BLVRoute("testPath", HTTPMethod.GET, BLVController));
  assert(BLVRoute("testPath", HTTPMethod.GET, BLVActionController));
  assert(BLVRoute("testPath", HTTPMethod.GET, BLVPageController));
}} 
