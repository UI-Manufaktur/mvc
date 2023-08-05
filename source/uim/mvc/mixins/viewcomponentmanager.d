/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.viewcomponentmanager;

import uim.mvc;
@safe:

// #region ViewComponentManager This
  string viewComponentManagerThis() {
    return "
  this() {}
    ";
  }

  template ViewComponentManagerThis() {
    const char[] ViewComponentManagerThis = viewComponentManagerThis();
  }
// #endregion ViewComponentManager This

// #region ViewComponentManager Calls
  string viewComponentManagerCalls() {
    return "
  auto ViewComponentManager() { return new DViewComponentManager(); }
    ";
  }

  template ViewComponentManagerCalls() {
    const char[] ViewComponentManagerCalls = viewComponentManagerCalls();
  }
// #endregion ViewComponentManager Calls

mixin template ViewComponentManagerTemplate() {
  // #region components
    protected IViewComponent[] _viewComponents;

    void viewComponents(IViewComponent[] someViewComponents) {
      _viewComponents = someViewComponents;
    }
    IViewComponent[] viewComponents() {
      return _viewComponents;
    }
    size_t countViewComponents() {
      return _viewComponents.length;
    }
  // #endregion components

  // #region components
    IViewComponent viewComponent(string name) {
      foreach(myComponent; viewComponents) if (myComponent.name() == name) return myComponent;
      return null; 
    }
  // #endregion components

  // #region addComponents
    void addViewComponents(IViewComponent[] someComponents...) {
      this.addViewComponents(someComponents.dup);
    }
    void addViewComponents(IViewComponent[] someComponents) {
      viewComponents(viewComponents~someComponents);
    }
  // #endregion addComponents

  void addViewComponent(string aName, IViewComponent aComponent) {
    if (auto myComponent = cast(DViewComponent)aComponent) {
      myComponent.name(aName);
    }

    addViewComponent(aComponent);
  }

  void addViewComponent(IViewComponent aComponent) {
    viewComponents(viewComponents~aComponent);
  }
}