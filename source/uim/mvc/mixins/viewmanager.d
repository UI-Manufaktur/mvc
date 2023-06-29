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
    return (_viewContainer ? _viewContainer : (_manager ? manager.viewContainer : null)); 
  }  
  void viewContainer(DViewContainer aViewContainer) {    
    _viewContainer = aViewContainer;
  }  
  // #endregion viewContainer
}

mixin template ViewManagerTemplate() {
  // #region views
    void views(IView[string] someViews) {
      foreach(myName, myView; someViews) {
        addView(myName, myView);
      }
    }

    void views(IView[] someViews...) {
      views(someViews.dup);
    }

    void views(IView[] someViews) {
      foreach(myView; someViews) {
        addView(myView);
      }
    }

    IView[] views() { 
      return (viewContainer ? viewContainer.values : null); 
    }

    string[] viewNames() {
      return (viewContainer ? viewContainer.keys : null);
    }
  // #endregion views

  // #region view
    IView view(string aName = null) {
      if (viewContainer is null) return null;

      return (aName ? viewContainer[aName] : viewContainer["default"]);
    }

    void view(IView aView) {
      if (aView) view(aView.name, aView);
    }
    void view(string aName, IView aView) {
      if (viewContainer) viewContainer[aName] = aView;
    }
  // #endregion viewView

  // #region defaultView
    void defaultView(IView aView) {
      addView("default", aView);
    }
    IView defaultView() {
      return view("default");
    }
  // #endregion defaultView

  // #region errorView
    void errorView(IView aView) {
      addView("error", aView);
    }
    IView errorView() {
      return view("error");
    }
  // #endregion errorView

  // #region hasView
    bool hasView(IView aView) {
      return (aView ? hasView(aView.name) : false);
    }
    bool hasView(string aName) {
      return (viewContainer ? (!(viewContainer[aName] is null)) : false);
    }
  // #endregion hasView

  // Add view if not exitst
  void addView(IView aView) {
    if (aView) addView(aView.name, aView);
  }
  void addView(string aName, IView aView) {
    if (viewContainer && aView && !hasView(aName)) _viewContainer.add(aName, aView);
  }

  // Update existing view
  void updateView(IView aView) {
     if (aView) updateView(aView.name, aView);
  }
  void updateView(string aName, IView aView) {
    if (aView && hasView(aName)) viewContainer.update(aName, aView);
  }

  // Remove existing view
  void removeView(IView aView) {
    if (aView) removeView(aView.name);
  }
  void removeView(string aName) {
    if (viewContainer && hasView(aName)) viewContainer.remove(aName);
  }
}