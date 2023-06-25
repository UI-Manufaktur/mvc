/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.viewmanager;

import uim.mvc;
@safe:

mixin template ViewManagerTemplate() {
  protected DViewContainer _viewContainer;

  void views(DViewContainer aContainer) {
    _viewContainer = aContainer;
  }
  DViewContainer views() { 
    return _viewContainer; 
  }

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

  IView view(string aName) {
    if (_viewContainer) return _viewContainer[aName];
    return null;
  }
  void view(string aName, IView aView) {
    if (_viewContainer) _viewContainer[aName] = aView;
  }

  bool existsView(string aName) {
    if (_viewContainer) return (aName in _viewContainer ? true : false);
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