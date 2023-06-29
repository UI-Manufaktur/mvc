/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.viewmanager;

import uim.mvc;
@safe:

mixin template ViewManagerTemplate() {
  // #region viewContainer
    protected DViewContainer _viewContainer;

    void viewContainer(DViewContainer aContainer) {
      _viewContainer = aContainer;
    }
    DViewContainer viewContainer() { 
      return viewContainer; 
    }
  // #endregion viewContainer

  // #region views
    void views(IView[string] someViews) {
      someViews.byKeyValue.each!(kv => view(kv.key, kv.value));
    }

    void views(IView[] someViews) {
      someViews.each!(col => view(col));
    }

    IView[] views() { 
      if (viewContainer) return viewContainer.values;
      return null; 
    }
    string[] viewNames() {
      if (viewContainer) return viewContainer.keys;
      return null;
    }
  // #endregion views

  // #region view
    IView view(string aName = null) {
      if (_viewContainer is null) return null;

      return (aName ? _viewContainer[aName, NullView] : _viewContainer[_defaultView]);
    }

    void view(IView aView) {
      if (aView) view(aView.name, aView);
    }
    void view(string aName, IView aView) {
      if (viewContainer) viewContainer[aName] = aView;
    }
  // #endregion viewView

  void defaultView(IView aView) {
    addView("default", aView);
  }
  IView defaultView() {
    return view("default");
  }
  void errorView(IView aView) {
    addView("error", aView);
  }
  IView errorView() {
    return view("error");
  }

  bool existsView(string aName) {
    if (_viewContainer) return (!(_viewContainer[aName] is null));
    return false;
  }

  // Add view if not exitst
  void addView(IView aView) {
    if (aView) addView(aView.name, aView);
  }
  void addView(string aName, IView aView) {
    if (_viewContainer && aView && !existsView(aName)) _viewContainer.add(aName, aView);
  }

  // Update existing view
  void updateView(IView aView) {
     if (aView) updateView(aView.name, aView);
  }
  void updateView(string aName, IView aView) {
    if (aView && existsView(aName)) _viewContainer.update(aName, aView);
  }

  // Remove existing view
  void removeView(IView aView) {
    if (aView) removeView(aView.name);
  }
  void removeView(string aName) {
    if (_viewContainer && existsView(aName)) _viewContainer.remove(aName);
  }
}