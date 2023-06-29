  /*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.layoutmanager;

import uim.mvc;
@safe:

mixin template LayoutManagerTemplate() {
  // #region layoutContainer
    protected DLayoutContainer _layoutContainer;

    void layoutContainer(DLayoutContainer aContainer) {
      _layoutContainer = aContainer;
    }
    DLayoutContainer layoutContainer() { 
      return layoutContainer; 
    }
  // #endregion layoutContainer

  // #region layouts

    void layouts(ILayout[string] someLayouts) {
      someLayouts.byKeyValue.each!(kv => layout(kv.key, kv.value));
    }

    void layouts(ILayout[] someLayouts) {
      someLayouts.each!(col => layout(col));
    }

    ILayout[] layouts() { 
      if (layoutContainer) return layoutContainer.values;
      return null; 
    }
    string[] layoutNames() {
      if (layoutContainer) return layoutContainer.keys;
      return null;
    }
  // #endregion layouts

  // #region layout
    ILayout layout(string aName = null) {
      if (_layoutcontainer is null) return null;

      if (aName) return _layoutcontainer[aName, NullLayout];
      return _layoutcontainer[_defaultLayout];
    }

    void layout(ILayout aLayout) {
      if (aLayout) layout(aLayout.name, aLayout);
    }
    void layout(string aName, ILayout aLayout) {
      if (layoutContainer) layoutContainer[aName] = aLayout;
    }
  // #endregion layout

  // #region defaultLayout
    protected string _defaultLayoutName;
    
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
      if (_layoutcontainer is null) return;

      _defaultLayoutName = aName;
      _layoutcontainer.add(aName, aLayout);
    }

    ILayout defaultLayout() {
      return layout(null);
    }
  // #endregion defaultLayout

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
    if (_layoutcontainer is null) return;

    _layoutcontainer.add(aName, aLayout);
  }

  void updateLayout(string aName, ILayout aLayout) {
    if (_layoutcontainer is null) return;

    _layoutcontainer.update(aName, aLayout);
  }

  void removeLayout(string aName) {
    if (_layoutcontainer is null) return;

    _layoutcontainer.remove(aName);
  }
}