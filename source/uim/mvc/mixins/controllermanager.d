/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.controllermanager;

import uim.mvc;
@safe:

mixin template ControllerContainerTemplate() {
  // #region controllerContainer
  protected DControllerContainer _controllerContainer;  
  DControllerContainer controllerContainer() {
    if (_controllerContainer) return _controllerContainer;
    return (_manager ? manager.controllerContainer : null); 
  }  
  void controllerContainer(DControllerContainer aControllerContainer) {    
    _controllerContainer = aControllerContainer;
  }  
  // #endregion controllerContainer
}

mixin template ControllerManagerTemplate() {
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
  
 IController controller(string aName) {
    return (_controllerContainer ? _controllerContainer[aName] : null);
  }
  void controller(string aName, IController aController) {
    if (_controllerContainer) _controllerContainer[aName] = aController;
  }

  bool hasController(string aName) {
    return (_controllerContainer ? !(_controllerContainer[aName] is null) : false);
  }

  // Add controller if not exitst
  void addController(IController aController) {
    if (aController) addController(aController.name, aController);
  }
  void addController(string aName, IController aController) {
    if (_controllerContainer && aController && !hasController(aName)) _controllerContainer.add(aName, aController);
  }

  // Update existing controller
  void updateController(IController aController) {
     if (aController) updateController(aController.name, aController);
  }
  void updateController(string aName, IController aController) {
    if (aController && hasController(aName)) _controllerContainer.update(aName, aController);
  }

  // Remove existing controller
  void removeController(IController aController) {
    if (aController) removeController(aController.name);
  }
  void removeController(string aName) {
    if (_controllerContainer && hasController(aName)) _controllerContainer.remove(aName);
  }
}