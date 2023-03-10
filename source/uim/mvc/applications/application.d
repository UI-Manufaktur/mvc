/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.applications.application;

@safe:
import uim.mvc;

class DMVCApplication : DMVCObject, IApplication { 
  this() { initialize; }

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
  }

  // #region parameters
    mixin(MVCParameter!("rootPath"));
  // #endregion parameters

  // Application data 
  mixin(OProperty!("UUID", "id"));
  mixin(OProperty!("size_t", "versionNumber"));

  // Interfaces
  mixin(OProperty!("DETBBase", "database"));
  mixin(OProperty!("ILayout", "layout"));
  mixin(OProperty!("DRoute[HTTPMethod][string]", "routes"));

  // Main Containers - Allways first
  mixin(OProperty!("DMVCLinkContainer",   "links"));
  mixin(OProperty!("DMVCMetaContainer",   "metas"));
  mixin(OProperty!("DMVCScriptContainer", "scripts"));
  mixin(OProperty!("DMVCStyleContainer",  "styles"));
  
  auto routesPaths() {
    return _routes.keys; 
  }

  auto routesAtPath(string path) {
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

  O addRoute(this O)(DRoute newRoute) {
    debug writeln("Adding route at '%s'".format(newRoute.path));
    if (newRoute) {
      newRoute.application(this);
      DRoute[HTTPMethod] routesAtPath = _routes.get(newRoute.path, null);
      routesAtPath[newRoute.method] = newRoute;

      _routes[newRoute.path] = routesAtPath;

      if (auto controller = newRoute.controller) controller.application(this);
    }
    return cast(O)this; }

  O register(this O)(URLRouter router) {
    debug writeln("Link Path '%s'".format(rootPath~"*"));
    router.any(rootPath~"*", &this.request);
    return cast(O)this; }

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse) {
    request(newRequest, newResponse, null); }

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, string[string] options) {
		debugMethodCall(moduleName!MVCApplication~":MVCApplication("~this.name~")::request(req, res, requestParameters)");

    writeln("rootPath = '%s'".format(this.rootPath));
    writeln("newRequest.fullURL = '%s'".format(newRequest.fullURL));
    writeln("newRequest.rootDir = '%s'".format(newRequest.rootDir));
    writeln("newRequest.path    = '%s'".format(newRequest.path));

    if (auto myLayout = cast(DLayout)this.layout) { myLayout.application(this); }

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
auto MVCApplication() { return new DMVCApplication; }

version(test_uim_mvc) unittest {
  assert(
    MVCApplication
      .addRoute(Route("ecm/index", HTTPMethod.GET, MVCPageController))
      .addRoute(Route("ecm/documents", HTTPMethod.GET, MVCPageController))
      .addRoute(Route("ecm/folders", HTTPMethod.GET, MVCPageController))
      .addRoute(Route("ecm/workspaces", HTTPMethod.GET, MVCPageController))
  );
}