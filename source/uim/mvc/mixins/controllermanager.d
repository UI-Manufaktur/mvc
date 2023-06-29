/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.controllermanager;

import uim.mvc;
@safe:

mixin template ControllerManagerTemplate() {
  // #region controllerContainer
    protected DControllerContainer _controllerContainer;

    void controllerContainer(DControllerContainer aContainer) {
      _controllerContainer = aContainer;
    }
    DControllerContainer controllerContainer() { 
      return controllerContainer; 
    }
  // #endregion controllerContainer

  // #region controllers
    void controllers(IController[string] someControllers) {
      someControllers.byKeyValue.each!(kv => controller(kv.key, kv.value));
    }

    void controllers(IController[] someControllers) {
      someControllers.each!(col => controller(col));
    }

    IController[] controllers() { 
      if (controllerContainer) return controllerContainer.values;
      return null; 
    }
    string[] controllerNames() {
      if (controllerContainer) return controllerContainer.keys;
      return null;
    }
  // #endregion controllers

  // #region controller
    IController controller(string aName = null) {
      if (_controllerContainer is null) return null;

      return (aName ? _controllerContainer[aName, NullController] : _controllerContainer[_defaultController]);
    }

    void controller(IController aController) {
      if (aController) controller(aController.name, aController);
    }
    void controller(string aName, IController aController) {
      if (controllerContainer) controllerContainer[aName] = aController;
    }
  // #endregion controller
  
 override IController controller(string aName) {
    return (_controllerContainer ? _controllerContainer[aName] : null);
  }
  override void controller(string aName, IController aController) {
    if (_controllerContainer) _controllerContainer[aName] = aController;
  }

  override bool existsController(string aName) {
    return (_controllerContainer ? !(_controllerContainer[aName] is null) : false);
  }

  // Add controller if not exitst
  override void addController(IController aController) {
    if (aController) addController(aController.name, aController);
  }
  override void addController(string aName, IController aController) {
    if (_controllerContainer && aController && !existsController(aName)) _controllerContainer.add(aName, aController);
  }

  // Update existing controller
  override void updateController(IController aController) {
     if (aController) updateController(aController.name, aController);
  }
  override void updateController(string aName, IController aController) {
    if (aController && existsController(aName)) _controllerContainer.update(aName, aController);
  }

  // Remove existing controller
  override void removeController(IController aController) {
    if (aController) removeController(aController.name);
  }
  override void removeController(string aName) {
    if (_controllerContainer && existsController(aName)) _controllerContainer.remove(aName);
  }
}