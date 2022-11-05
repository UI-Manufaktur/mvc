module uim.baklava.applications.application;

@safe:
import uim.baklava;

class DBLVApplication : DBLVBase, IBLVApplication { 
  this() { initialize; }

  override void initialize() {
    super.initialize;
  }

  // Application data 
  mixin(OProperty!("UUID", "id"));
  mixin(BLVParameter!("rootPath"));
  mixin(OProperty!("size_t", "versionNumber"));
  mixin(OProperty!("Json", "config"));

  // Interfaces
  mixin(OProperty!("DETBBase", "database"));
  mixin(OProperty!("DBLVLayout", "layout"));
  mixin(OProperty!("DBLVRoute[HTTPMethod][string]", "routes"));

  // Main Containers - Allways first
  mixin(OProperty!("DBLVLinkContainer",   "links"));
  mixin(OProperty!("DBLVMetaContainer",   "metas"));
  mixin(OProperty!("DBLVScriptContainer", "scripts"));
  mixin(OProperty!("DBLVStyleContainer",  "styles"));
  
  auto routesPaths() {
    return _routes.keys; 
  }

  auto routes(string path) {
    debug writeln("Get routes at '%s'".format(path));
    return _routes.get(path, null); 
  }

  auto route(string path, HTTPMethod method) {
    debug writeln("Get route at '%s' and '%s'".format(path, method));
    if (auto routesAtPath = _routes.get(path, null)) {
      return routesAtPath.get(method, null);
    } 
    return null;
  }

  O addRoute(this O)(DBLVRoute newRoute) {
    debug writeln("Adding route at '%s'".format(newRoute.path));
    if (newRoute) {
      newRoute.application(this);
      DBLVRoute[HTTPMethod] routesAtPath = _routes.get(newRoute.path, null);
      routesAtPath[newRoute.method] = newRoute;

      _routes[newRoute.path] = routesAtPath;

      if (auto controller = newRoute.controller) controller.application(this);
    }
    return cast(O)this;
  }

  O register(this O)(URLRouter router) {
    debug writeln("Link Path '%s'".format(rootPath~"*"));
    router.any(rootPath~"*", &this.request);
    return cast(O)this;
  }

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse) {
    request(newRequest, newResponse, null);
  }
  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, string[string] options) {
		debugMethodCall(moduleName!BLVApplication~":BLVApplication("~this.name~")::request(req, res, reqParameters)");

    writeln("rootPath = '%s'".format(this.rootPath));
    writeln("newRequest.fullURL = '%s'".format(newRequest.fullURL));
    writeln("newRequest.rootDir = '%s'".format(newRequest.rootDir));
    writeln("newRequest.path    = '%s'".format(newRequest.path));

    if (this.layout) this.layout.application(this);

    writeln(routesPaths);
    if (newRequest.path.length >= rootPath.length) {
      auto myPath = newRequest.path[rootPath.length..$];
      writeln("myPath = '%s'".format(myPath));
      if (auto myRoute = route(myPath, newRequest.method)) {
        debug writeln("Found route");

        myRoute.controller.request(newRequest, newResponse, options);
      }
    }
  }
}
auto BLVApplication() { return new DBLVApplication; }

version(test_uim_mvc) unittest {
  assert(
    BLVApplication
      .addRoute(BLVRoute("ecm/index", HTTPMethod.GET, BLVPageController))
      .addRoute(BLVRoute("ecm/documents", HTTPMethod.GET, BLVPageController))
      .addRoute(BLVRoute("ecm/folders", HTTPMethod.GET, BLVPageController))
      .addRoute(BLVRoute("ecm/workspaces", HTTPMethod.GET, BLVPageController))
  );
}