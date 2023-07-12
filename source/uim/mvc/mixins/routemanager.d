/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.routemanager;

import uim.mvc;
@safe:

template RouteManagerTemplate() {
  protected IRoute[] _routes;

  IRoute[] routes() {
    return _routes;
  }

  string[] routePaths() {
    return routes
      .map!(r => r.path)
      .array;
  }

  IRoute route(string aPath) {
    foreach(myRoute; routes) {
      if (myRoute.path == aPath) { return myRoute; }
    }

    return null;
  }

  IRoute route(string aPath, HTTPMethod aMethod) {
    foreach(myRoute; routes) {
      if (myRoute.path == aPath && myRoute.method == aMethod) { 
        return myRoute; 
      }
    }

    return null;
  }

  bool existsRoute(string aPath) {
    return (route(aPath) !is null);
  }
  bool existsRoute(string aPath, HTTPMethod aMethod) {
    return (route(aPath,aMethod) !is null);
  }

  O addRoutes(this O)(IRoute[] someRoutes...) {    
    this.addRoutes(someRoutes.dup);
    return cast(O)this;
  }
  O addRoutes(this O)(IRoute[] someRoutes) {    
    someRoutes.each!(route => this.addRoute(route));
    return cast(O)this;
  }

  void addRoute(IRoute aRoute) {    
    _routes ~= aRoute;
  }

  // Update existing route
  void updateRoute(string aPath, HTTPMethod aMethod, IRoute aRoute) {
    foreach(index, myRoute; routes) {
      if (myRoute.path == aPath && myRoute.method == aMethod) { 
        _routes[index] = aRoute; 
      }
    }
  }

  // Remove existing route
  void removeRoute(string aPath, HTTPMethod aMethod) {
    foreach(index, myRoute; routes) {
      if (myRoute.path == aPath && myRoute.method == aMethod) { 
        _routes.remove(index); 
      }
    }
  }
}

