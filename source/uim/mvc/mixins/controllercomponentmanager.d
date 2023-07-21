/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.controllercomponentmanager;

import uim.mvc;
@safe:

// #region ControllerComponentManager This
  string controllerComponentManagerThis() {
    return "
  this() {}
    ";
  }

  template ControllerComponentManagerThis() {
    const char[] ControllerComponentManagerThis = controllerComponentManagerThis();
  }
// #endregion ControllerComponentManager This

// #region ControllerComponentManager Calls
  string controllerComponentManagerCalls() {
    return "
  auto ControllerComponentManager() { return new DControllerComponentManager(); }
    ";
  }

  template ControllerComponentManagerCalls() {
    const char[] ControllerComponentManagerCalls = controllerComponentManagerCalls();
  }
// #endregion ControllerComponentManager Calls

mixin template ControllerComponentManagerTemplate() {
  // #region components
    void components(IControllerComponent[] someComponents...) {
      this.components(someComponents.dup);
    }
  // #endregion components

  // #region addComponents
    void addComponents(IControllerComponent[] someComponents...) {
      addComponents(someComponents.dup);
    }
    void addComponents(IControllerComponent[] someComponents) {
      this.components(this.components~someComponents);
    }
  // #endregion addComponents

  void addComponent(IControllerComponent aComponent) {
    this.components(this.components~aComponent);
  }
}