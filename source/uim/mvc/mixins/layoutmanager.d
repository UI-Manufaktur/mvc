  /*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.layoutmanager;

import uim.mvc;
@safe:

// #region LayoutManager This
  string layoutManagerThis() {
    return "
  this() {}
    ";
  }

  template LayoutManagerThis() {
    const char[] LayoutManagerThis = layoutManagerThis();
  }
// #endregion LayoutManager This

// #region LayoutManager Calls
  string layoutManagerCalls() {
    return "
  auto LayoutManager() { return new DLayoutManager(); }
    ";
  }

  template LayoutManagerCalls() {
    const char[] LayoutManagerCalls = layoutManagerCalls();
  }
// #endregion LayoutManager Calls

// #region LayoutContainerTemplate
  mixin template LayoutContainerTemplate() {
    protected DLayoutContainer _layoutContainer;  
    DLayoutContainer layoutContainer() {
      return (_layoutContainer 
        ? _layoutContainer 
        : (_manager ? manager.layoutContainer : null)); 
    }  
    void layoutContainer(DLayoutContainer aLayoutContainer) {    
      _layoutContainer = aLayoutContainer;
    }  
  }
// #endregion LayoutContainerTemplate

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

      return (aName ? layoutContainer[aName] : layoutContainer["default"]);
    }

    void layout(ILayout aLayout) {
      if (aLayout) layout(aLayout.name, aLayout);
    }
    void layout(string aName, ILayout aLayout) {
      if (layoutContainer) layoutContainer[aName] = aLayout;
    }
  // #endregion layout

  bool hasLayout(ILayout aLayout) {
    return (aLayout ? hasLayout(aLayout.name) : false);
  }
  bool hasLayout(string aName) {
    return (layoutContainer 
    ? (layoutContainer[aName] ? true : false) 
    : false);
  }

  // #region defaultLayout
    void defaultLayout(ILayout aLayout) {
      if (layoutContainer is null) return;

      layoutContainer["default"] = aLayout;
    }

    ILayout defaultLayout() {
      return (layoutContainer ? layoutContainer["default"] : null);
    }
  // #endregion defaultLayout

  // #region errorLayout
    void errorLayout(ILayout aLayout) {
      layout("error", aLayout);
    }

    ILayout errorLayout() {
      return layout("error");
    }
  // #endregion errorLayout

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