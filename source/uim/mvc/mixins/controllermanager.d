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

    void controllers(IController[] someControllers...) {
      this.controllers(someControllers.dup);
    }

    void controllers(IController[] someControllers) {
      someControllers.each!(col => controller(col));
    }

    IController[] controllers() { 
      return (controllerContainer ? controllerContainer.values : null); 
    }
    string[] controllerNames() {
      return (controllerContainer ? controllerContainer.keys : null);
    }
  // #endregion controllers

  // #region controller
    IController controller(string aName = null) {
      return (controllerContainer ? (aName ? controllerContainer[aName] : null) : null);
    }   

    void controller(IController aController) {
      if (aController) controller(aController.name, aController);
    }
    void controller(string aName, IController aController) {
      if (controllerContainer) controllerContainer[aName] = aController;
    }
  // #endregion controller
  
  bool hasController(IController aController) {
    return (aController ? hasController(aController.name) : false);
  }
  bool hasController(string aName) {
    return (controllerContainer ? !(controllerContainer[aName] is null) : false);
  }

  // Add controller if not exitst
  void addController(IController aController) {
    if (aController) addController(aController.name, aController);
  }
  void addController(string aName, IController aController) {
    if (controllerContainer && aController && !hasController(aName)) controllerContainer.add(aName, aController);
  }

  // Update existing controller
  void updateController(IController aController) {
     if (aController) updateController(aController.name, aController);
  }
  void updateController(string aName, IController aController) {
    if (aController && hasController(aName)) controllerContainer.update(aName, aController);
  }

  // Remove existing controller
  void removeController(IController aController) {
    if (aController) removeController(aController.name);
  }
  void removeController(string aName) {
    if (controllerContainer && hasController(aName)) controllerContainer.remove(aName);
  }
}