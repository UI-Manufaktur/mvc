  /*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.layoutmanager;

import uim.mvc;
@safe:

mixin template LayoutManagerTemplate() {
  protected DLayoutContainer _layouts;
  protected string _defaultLayoutName;

  void layouts(DLayoutContainer aContainer) {
    _layouts = aContainer;
  }

  DLayoutContainer layouts() {    
    return _layouts;
  }

  void defaultLayoutName(string aName) {
    _defaultLayoutName = aName;
  }
  string defaultLayoutName() {
    return _defaultLayoutName;
  }

  void defaultLayout(ILayout aLayout) {
    defaultLayout(aLayout.name, aLayout);
  }
  void defaultLayout(string aName, ILayout aLayout) {
    if (_layouts is null) return;

    _defaultLayoutName = aName;
    _layouts.add(aName, aLayout);
  }

  ILayout defaultLayout() {
    return layout(null);
  }

  ILayout layout(string aName = null) {
    if (_layouts is null) return null;

    if (aName) return _layouts[aName, NullLayout];
    return _layouts[_defaultLayout];
  }

  void addLayouts(ILayout[] someLayouts...) {
    addLayouts(someLayouts.dup);
  }
  void addLayouts(ILayout[] someLayouts) {
    someLayouts.each!(myLayout => addLayout(myLayout));
  }

  void addLayouts(ILayout[string] someLayouts) {
    someLayouts.byKeyValue.each!(kv => addLayout(kv.key, kv.value));
  }

  void addLayout(ILayout aLayout) {    
    addLayout(aLayout.name, aLayout);
  }
  void addLayout(string aName, ILayout aLayout) {
    if (_layouts is null) return;

    _layouts.add(aName, aLayout);
  }

  void updateLayout(string aName, ILayout aLayout) {
    if (_layouts is null) return;

    _layouts.update(aName, aLayout);
  }

  void removeLayout(string aName) {
    if (_layouts is null) return;

    _layouts.remove(aName);
  }
}