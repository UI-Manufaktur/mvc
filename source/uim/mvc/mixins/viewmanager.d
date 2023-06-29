/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.viewmanager;

import uim.mvc;
@safe:

mixin template ViewManagerContainerTemplate() {
  // #region viewContainer
  protected DViewContainer _viewContainer;  
  DViewContainer viewContainer() {
    if (_viewContainer) return _viewContainer;
    return (_manager ? manager.viewContainer : null); 
  }  
  void viewContainer(DViewContainer aViewContainer) {    
    _viewContainer = aViewContainer;
  }  
  // #endregion viewContainer
}

mixin template ViewManagerTemplate() {
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
      if (viewContainer is null) return null;

      return (aName ? viewContainer[aName] : viewContainer[_defaultView]);
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
    if (viewContainer) return (!(viewContainer[aName] is null));
    return false;
  }

  // Add view if not exitst
  void addView(IView aView) {
    if (aView) addView(aView.name, aView);
  }
  void addView(string aName, IView aView) {
    if (viewContainer && aView && !existsView(aName)) _viewContainer.add(aName, aView);
  }

  // Update existing view
  void updateView(IView aView) {
     if (aView) updateView(aView.name, aView);
  }
  void updateView(string aName, IView aView) {
    if (aView && existsView(aName)) viewContainer.update(aName, aView);
  }

  // Remove existing view
  void removeView(IView aView) {
    if (aView) removeView(aView.name);
  }
  void removeView(string aName) {
    if (viewContainer && existsView(aName)) viewContainer.remove(aName);
  }
}