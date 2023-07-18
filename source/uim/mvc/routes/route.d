/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.routes.route;

import uim.mvc;

@safe:
class DRoute : DMVCObject, IRoute {
  this() { super(); }

  this(string aPath) {
    this().path(aPath);
  }
  this(HTTPMethod aMethod) {
    this().method(aMethod);
  }
  this(IController aController) {
    this().controller(aController);
  }

  this(string aPath, HTTPMethod aMethod, IController aController) {
    this().path(aPath).method(aMethod).controller(aController);
  }

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
  }

  mixin(OProperty!("string", "path"));
  mixin(OProperty!("IRouteManager", "manager"));
  
  ///
  unittest {
    auto route = new DRoute;
    assert(route.path("this/is/a/path").path == "this/is/a/path");  
  }

  mixin(OProperty!("HTTPMethod", "method"));
  ///
  unittest {
    auto route = new DRoute;
    assert(route.method(HTTPMethod.GET).method == HTTPMethod.GET);  
  }

  mixin(OProperty!("IController", "controller"));
  ///
  unittest {
    IController controller = new DController("test");
    auto route = new DRoute;
    assert(route.controller(controller).controller.name == "test");  
  }

  mixin(OProperty!("string", "controllerName"));
  ///
  unittest {
    auto route = new DRoute;
    assert(route.controllerName("testName").controllerName == "testName");  
  }

  bool isHandler(string aPath, HTTPMethod aMethod) {
    return (aPath == this.path && aMethod == this.method);
  }
}
auto Route() { return new DRoute; }
auto Route(string aPath, HTTPMethod aMethod, IController aController) { return new DRoute(aPath, aMethod, aController); }
