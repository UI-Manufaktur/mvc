/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.applications.application;

import uim.mvc;

@safe:
class DApplication : DMVCObject /* , IApplication */ {
  this() {
    super();
  }

  override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);

    this
      .className("Application")
      .registerPath(className.toLower);
  }

  O register(this O)(URLRouter router) {
    debug writeln("Link Path '%s'".format(rootPath ~ "*"));
    router.any(rootPath ~ "*", &this.request);
    return cast(O) this;
  }

  /* void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse) {
    request(newRequest, newResponse, null); }

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, STRINGAA options) {
		debugMethodCall(moduleName!Application~":Application("~this.name~")::request(req, res, requestParameters)");

    writeln("rootPath = '%s'".format(this.rootPath));
    writeln("newRequest.fullURL = '%s'".format(newRequest.fullURL));
    writeln("newRequest.rootDir = '%s'".format(newRequest.rootDir));
    writeln("newRequest.path    = '%s'".format(newRequest.path));

    if (auto myLayout = cast(DLayout)this.layout) { myLayout.application(this); }

    writeln(routesPaths);
    if (newRequest.path.length >= rootPath.length) {
      auto myPath = newRequest.path; // [rootPath.length..];
      writeln("myPath = '%s'".format(myPath));
      if (auto myRoute = route(myPath, newRequest.method)) {
        debug writeln("Found route");

        myRoute.controller.request(newRequest, newResponse, options);
      }
    }
  } */
}

auto Application() {
  return new DApplication;
}

/*

module uim.mvc.applications.application;

import uim.mvc;

@safe:
class DAPPApplication {
  this() { 
    debug writeln("this()");
    this
      .links(MVCLinkContainer) 
      .metas(MVCMetaContainer) 
      .scripts(ScriptContainer) 
      .styles(StyleContainer); 
  }

  this(DLayout mylayout) {
    debug writeln("this(myLayout)");
    this().layout(mylayout); }

  mixin(OProperty!("UUID", "id"));
  mixin(OProperty!("string", "name"));
  mixin(OProperty!("string", "rootPath"));
  mixin(OProperty!("size_t", "versionNumber"));
  mixin(OProperty!("DEntityBase", "DEntityBase", "entityBase"));
  mixin(OProperty!("DLayout", "layout"));
  mixin(OProperty!("STRINGAA", "parameters"));
  mixin(OProperty!("Json", "config"));

  // Containers
  mixin(OProperty!("DMVCLinkContainer", "links"));
  mixin(OProperty!("DMVCMetaContainer", "metas"));
  mixin(OProperty!("DScriptContainer", "scripts"));
  mixin(OProperty!("DStyleContainer", "styles"));

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
auto APPApplication(DLayout myLayout) { return new DAPPApplication(myLayout); }

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

	mixin(OProperty!("DEntityBase", "DEntityBase", "entityBase"));

/*   mixin(OProperty!("DSecurityController", "securityController")); 
  mixin(OProperty!("DSecurityOptions(", "securityOptions"));
  O securityOptions(this O)(bool[string] newOptions) { this.securityOptions(SecurityOptions((newOptions)); return cast(O)this; }  

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
