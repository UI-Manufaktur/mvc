/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.routemanager;

import uim.mvc;
@safe:

interface IRouteManager {
  void routes(IRoute[string] someRoutes);
  void routes(IRoute[] someRoutes);
  IRoute[] routes();
  string[] routeNames();

  IRoute route(string aName);
  void route(string aName, IRoute aRoute);

  void defaultRoute(IRoute aRoute);
  IRoute defaultRoute();

  void errorRoute(IRoute aRoute);
  IRoute errorRoute();

  bool existsRoute(string aName);

  // Add route if not exitst
  void addRoute(IRoute aRoute);
  void addRoute(string aName, IRoute aRoute);

  // Update existing route
  void updateRoute(IRoute aRoute);
  void updateRoute(string aName, IRoute aRoute);

  // Remove existing route
  void removeRoute(IRoute aRoute);
  void removeRoute(string aName);
}
