/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.routemanager;

import uim.mvc;
@safe:

interface IRouteManager {
  IRoute[] routes();
  string[] routePaths();
  IRoute[] routesWithMethod(HTTPMethod aMethod);

  IRoute route(string aPath);
  IRoute route(string aPath, HTTPMethod aMethod);

  bool existsRoute(string aPath);
  bool existsRoute(string aPath, HTTPMethod aMethod);

  // Add route if not exists
  void addRoute(IRoute aRoute);

  // Update existing route
  void updateRoute(string aPath, HTTPMethod aMethod, IRoute aRoute);

  // Remove existing route
  void removeRoute(string aPath, HTTPMethod aMethod);
}
