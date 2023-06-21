  /*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module  uim.mvc.mixins.layoutmanager;

import uim.mvc;
@safe:

template LayoutManagerTemplate() {
  protected DLayoutContainer _layouts;
  protected string _defaultLayoutName;

  void defaultLayout(ILayout aLayout) {
    defaultLayout(aLayout.name, aLayout);
  }
  void defaultLayout(string aName, ILayout aLayout) {
    _defaultLayoutName = aName;
    _layouts.add(aName, aLayout);
  }

  ILayout defaultLayout() {
    return layout(null);
  }

  ILayout layout(string aName = null) {
    if (aName) return _layouts[aName, NullLayout];
    return _layouts[_defaultLayout];
  }

  void addLayout(ILayout aLayout) {
    addLayout(aLayout.name, aLayout);
  }
  void addLayout(string aName, ILayout aLayout) {
    _layouts.add(aName, aLayout);
  }

  void updateLayout(string aName, ILayout aLayout) {
    _layouts.update(aName, aLayout);
  }

  void removeLayout(string aName) {
    _layouts.remove(aName);
  }
}