/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.routers.collection;

import uim.mvc;
@safe:

/**
 * Contains a collection of routes.
 *
 * Provides an interface for adding/removing routes
 * and parsing/generating URLs with the routes it contains.
 */
class DRouterCollection {
    /**
    * The routes connected to this collection.
    *
    * @var array<string, DRoute>>
    */
  protected DRoute[string][] _routeTable = null;

  // The hash map of named routes that are in this collection.
  protected DRoute[string] _named = null;

  /**
    * A map of middleware names and the related objects.
    *
    * @var array
    */
  /* protected MiddleWWare[string] _middleware = null; */

  /**
    * A map of middleware group names and the related middleware names.
    *
    * @var array
    */
  /* protected  MiddleWWareGroup[string] _middlewareGroups = null; */
}