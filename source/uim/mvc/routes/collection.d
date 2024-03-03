/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.routes.entityCollection;

import uim.mvc;

@safe:
class DRouteCollection : DMVCObject, IRouteCollection {

  override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);

    // Default HTTP request method: controller action map.
    _resourceMap = [
      "index": ["action": "index", "method": "GET", "path": ""],
      "create": ["action": "add", "method": "POST", "path": ""],
      "view": ["action": "view", "method": "GET", "path": "{id}"],
      "update": ["action": "edit", "method": "PUT,PATCH", "path": "{id}"],
      "delete": ["action": "delete", "method": "DELETE", "path": "{id}"],
    ];
  }

  // Default HTTP request method: controller action map.
  protected static STRINGAA[string] _resourceMap;

  // The extensions that should be set into the routes connected.
  protected string[] _extensions = null;

  // Routes indexed by path prefix.
  protected IRoute[string] _paths = null;
}