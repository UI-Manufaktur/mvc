/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.controllercomponentmanager;

import uim.mvc;
@safe:

mixin template ControllerComponentManagerTemplate() {
  // #region components
    protected IControllerComponent[] _controllerComponents;

    IControllerComponent[] components() {
      return _controllerComponents;
    }

    void components(IControllerComponent[] someComponents...) {
      components(someComponents.dup);
    }
    void components(IControllerComponent[] someComponents) {
      _controllerComponents = someComponents;
    }
  // #endregion components

  // #region addComponents
    void addComponents(IControllerComponent[] someComponents...) {
      addComponents(someComponents.dup);
    }
    void addComponents(IControllerComponent[] someComponents) {
      _controllerComponents ~= someComponents;
    }
  // #endregion addComponents

  void addComponent(IControllerComponent aComponent) {
    _controllerComponents ~= aComponent;
  }
}