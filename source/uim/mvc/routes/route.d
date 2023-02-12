/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.routes.route;

@safe:
import uim.mvc;

class DRoute : DMVCBase, IRoute {
  this() { super(); }
  this(string aPath, HTTPMethod aMethod, DController aController) {
    this().path(aPath).method(aMethod).controller(aController);
  }

  override void initialize(DConfig configSettings = null) {
    super.initialize(configSettings);
  }

  mixin(OProperty!("string", "path"));
  mixin(OProperty!("HTTPMethod", "method"));
  mixin(OProperty!("DController", "controller"));
}
auto Route() { return new DRoute; }
auto Route(string aPath, HTTPMethod aMethod, DController aController) { return new DRoute(aPath, aMethod, aController); }

version(test_uim_mvc) { unittest { 
  assert(Route);
  assert(Route("testPath", HTTPMethod.GET, Controller));
  assert(Route("testPath", HTTPMethod.GET, MVCActionController));
  assert(Route("testPath", HTTPMethod.GET, MVCPageController));
}} 
