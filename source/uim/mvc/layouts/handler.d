/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.layouts.handler;

import uim.mvc;
@safe:

class DLayoutHandler {
  this() { }

  protected ILayout[string] _layouts;

  ILayout opIndex(string name) {
    return _layouts.get(name, null);    
  }
  ILayout opIndexAssign(ILayout newLayout, string name) {
    return _layouts[name] = newLayout;    
  }
}
auto LayoutHandler() { return new DLayoutHandler; }

///
unittest {
  auto handler = new DLayoutHandler;
  auto layout = new DLayout;
}