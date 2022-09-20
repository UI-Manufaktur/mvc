module uim.mvc.applications.application;

@safe:
import uim.mvc;

class DMVCApplication : DMVCBase, IMVCApplication { 
  this() { initialize; }

  override void initialize() {
    super.initialize;
  }

  mixin(OProperty!("string", "rootPath"));
  mixin(OProperty!("DMVCRoute[HTTPMethod][string]", "routes"));

  auto routes(string path) {
    return _routes.get(path, null); 
  }

  auto route(string path, HTTPMethod method) {
    if (auto routesAtPath = _routes.get(path, null)) {
      return routesAtPath.get(method, null);
    } 
    return null;
  }

  O addRoute(this O)(DMVCRoute newRoute) {
    if (auto routesAtPath = _routes.get(newRoute.path, null)) {
      routesAtPath[newRoute.method] = newRoute;
    }
    return cast(O)this;
  }

  O register(this O)(URLRouter router) {
    router.any(rootPath, &request);
    return cast(O)this;
  }

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, string[string] options = null) {
		debugMethodCall(moduleName!DMVCController~":DMVCController("~this.name~")::request(req, res, reqParameters)");

    writeln("fullURL = ", newRequest.fullURL);
    writeln("rootDir = ", newRequest.rootDir);
  }
}
auto MVCApplication() { return new DMVCApplication; }

version(test_uim_mvc) unittest {
  assert(
    MVCApplication
      .addRoute(MVCRoute("ecm/documents", HTTPMethod.GET, MVCController))
      .addRoute(MVCRoute("ecm/folders", HTTPMethod.GET, MVCController))
  );
}