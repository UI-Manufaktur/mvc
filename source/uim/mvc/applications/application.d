/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.applications.application;

@safe:
import uim.mvc;

class DApplication : DMVCObject, IApplication { 
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
		debugMethodCall(moduleName!Application~":Application("~this.name~")::request(req, res, requestParameters)");

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
auto Application() { return new DApplication; }

version(test_uim_mvc) unittest {
  assert(
    Application
      .addRoute(Route("ecm/index", HTTPMethod.GET, MVCPageController))
      .addRoute(Route("ecm/documents", HTTPMethod.GET, MVCPageController))
      .addRoute(Route("ecm/folders", HTTPMethod.GET, MVCPageController))
      .addRoute(Route("ecm/workspaces", HTTPMethod.GET, MVCPageController))
  );
}

/*

module uim.mvc.applications.application;

@safe:
import uim.mvc;

class DAPPApplication {
  this() { 
    debug writeln("this()");
    this
      .links(MVCLinkContainer) 
      .metas(MVCMetaContainer) 
      .scripts(MVCScriptContainer) 
      .styles(MVCStyleContainer); 
  }

  this(DAPPLayout mylayout) {
    debug writeln("this(myLayout)");
    this().layout(mylayout); }

  mixin(OProperty!("UUID", "id"));
  mixin(OProperty!("string", "name"));
  mixin(OProperty!("string", "rootPath"));
  mixin(OProperty!("size_t", "versionNumber"));
  mixin(OProperty!("DETBBase", "database"));
  mixin(OProperty!("DAPPLayout", "layout"));
  mixin(OProperty!("STRINGAA", "parameters"));
  mixin(OProperty!("Json", "config"));

  // Containers
  mixin(OProperty!("DMVCLinkContainer", "links"));
  mixin(OProperty!("DMVCMetaContainer", "metas"));
  mixin(OProperty!("DMVCScriptContainer", "scripts"));
  mixin(OProperty!("DMVCStyleContainer", "styles"));

  mixin(OProperty!("DControllerRegistry", "controllers"));  
  DController controller(string path) {
    return controllers ? controllers[path] : null; 
  }
  O controller(this O)(string path, DController newController) {
    if (controllers) controllers[path] = newController;
    return cast(O)this; 
  }

  mixin(OProperty!("DViewRegistry", "views"));  
  DView view(string path) {
    return views ? views[path] : null; 
  }
  O view(this O)(string path, DView newView) {
    if (views) controlleviewsrs[path] = newView;
    return cast(O)this; 
  }
}
auto APPApplication() { return new DAPPApplication; }
auto APPApplication(DAPPLayout myLayout) { return new DAPPApplication(myLayout); }

version(test_uim_apps) { unittest {
	assert(APPApplication);
	auro testId = randomUUID;
	assert(APPApplication.id(testId).id == testId);
	assert(APPApplication.name("testName").name == "testName");
	assert(APPApplication.rootPath("testPath").rootPath == "testPath");
	assert(APPApplication.versionNumber(1).versionNumber == 1);

}}
/* class DAPPApplication  {
	this() { super(); }

	mixin(OProperty!("DETBBase", "database"));

/*   mixin(OProperty!("DAPPSecurityController", "securityController")); 
  mixin(OProperty!("DAPPSecurityOptions", "securityOptions"));
  O securityOptions(this O)(bool[string] newOptions) { this.securityOptions(APPSecurityOptions(newOptions)); return cast(O)this; }  

  override void afterInsertObj(DController appObject) {
    super.afterInsertObj(appObject);

    if (auto page = cast(DAPPPage)appObject) {
      if (!page.securityController) page.securityController(securityController.copy.page(page));
      if (!page.securityOptions) page.securityOptions(securityOptions.copy);
    }
  }
 * /
}
auto APPUIM() { return new DAPPUIM(); }
auto APPUIM(string aName) { return APPUIM.name(aName); }
auto APPUIM(string aName, string aRootPath) { return APPUIM(aName).rootPath(aRootPath); }

 */
