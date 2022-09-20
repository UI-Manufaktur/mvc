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
    router.any(rootPath~"*", &this.request);
    return cast(O)this;
  }

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse) {
    request(newRequest, newResponse, null);
  }
  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, string[string] options) {
		debugMethodCall(moduleName!DMVCController~":DMVCController("~this.name~")::request(req, res, reqParameters)");

    writeln("fullURL = ", newRequest.fullURL);
    writeln("rootDir = ", newRequest.rootDir);
  }
}
auto MVCApplication() { return new DMVCApplication; }

version(test_uim_mvc) unittest {
  assert(
    MVCApplication
      .addRoute(MVCRoute("ecm/index", HTTPMethod.GET, MVCPageController))
      .addRoute(MVCRoute("ecm/documents", HTTPMethod.GET, MVCPageController))
      .addRoute(MVCRoute("ecm/folders", HTTPMethod.GET, MVCPageController))
      .addRoute(MVCRoute("ecm/workspaces", HTTPMethod.GET, MVCPageController))
  );
}