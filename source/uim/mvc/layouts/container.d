/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.layouts.container;

import uim.mvc;
@safe:

class DLayoutContainer : ILayoutContainer {
  this() { }

  protected ILayout[string] _layouts;

  ILayout opIndex(string name) {
    return _layouts.get(name, null);    
  }
  ILayout opIndexAssign(ILayout newLayout, string name) {
    return _layouts[name] = newLayout;    
  }
}
auto LayoutContainer() { return new DLayoutContainer; }

///
unittest {
  auto container = new DLayoutContainer;
  auto layout = new DLayout;
}