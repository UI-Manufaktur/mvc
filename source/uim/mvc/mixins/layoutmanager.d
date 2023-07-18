  /*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.layoutmanager;

import uim.mvc;
@safe:

mixin template LayoutContainerTemplate() {
  // #region layoutContainer
  protected DLayoutContainer _layoutContainer;  
  DLayoutContainer layoutContainer() {
    return (_layoutContainer ? _layoutContainer : (_manager ? manager.layoutContainer : null)); 
  }  
  void layoutContainer(DLayoutContainer aLayoutContainer) {    
    _layoutContainer = aLayoutContainer;
  }  
  // #endregion layoutContainer
}

mixin template LayoutManagerTemplate() {
  // #region layouts
    void layouts(ILayout[string] someLayouts) {
      someLayouts.byKeyValue.each!(kv => layout(kv.key, kv.value));
    }

    void layouts(ILayout[] someLayouts) {
      someLayouts.each!(col => layout(col));
    }

    ILayout[] layouts() { 
      return (layoutContainer ? layoutContainer.values : null); 
    }
    string[] layoutNames() {
      return (layoutContainer ? layoutContainer.keys : null);
    }
  // #endregion layouts

  // #region layout
    ILayout layout(string aName = null) {
      if (layoutContainer is null) return null;

      return (aName ? layoutContainer[aName] : layoutContainer[_defaultLayoutName]);
    }

    void layout(ILayout aLayout) {
      if (aLayout) layout(aLayout.name, aLayout);
    }
    void layout(string aName, ILayout aLayout) {
      if (layoutContainer) layoutContainer[aName] = aLayout;
    }
  // #endregion layout

  // #region defaultLayout
    protected string _defaultLayoutName = "default";
    
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
      if (layoutContainer is null) return;

      _defaultLayoutName = aName;
      layoutContainer.add(aName, aLayout);
    }

    ILayout defaultLayout() {
      return layout(_defaultLayoutName);
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
    if (layoutContainer is null) return;

    layoutContainer.add(aName, aLayout);
  }

  bool updateLayout(string aName, ILayout aLayout) {
    if (layoutContainer) {
      layoutContainer.update(aName, aLayout);
      return true;
    }
    return false;
  }

  bool removeLayout(string aName) {
    if (layoutContainer) {
      layoutContainer.remove(aName);
      return true;
    }
    return false;
  }
}