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
      return (manager ? this.manager.controllerContainer : null); 
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
      return 
        (controllerContainer ? controllerContainer.values : null)~ 
        (manager ? manager.controllers : null);
    }
    string[] controllerNames() {
      return
        (controllerContainer ? controllerContainer.keys : null)~ 
        (manager ? manager.controllerNames : null);
    }
  // #endregion controllers

  // #region controller
    IController controller(string aName = null) {
      if (auto myController = (controllerContainer ? 
        (aName ? controllerContainer[aName] : null) 
        : null)) {
          return myController;          
        }
      if (manager) { return manager.controller(aName); } 

      return null;
    }   

    void controller(IController aController) {
      if (aController) controller(aController.name, aController);
    }
    void controller(string aName, IController aController) {
      if (controllerContainer) controllerContainer[aName] = aController;
    }
  // #endregion controller
  
  // #region hasController
    bool hasController(IController aController) {
      return (aController ? hasController(aController.name) : false);
    }
    bool hasController(string aName) {
      if (controllerContainer && !(controllerContainer[aName] is null)) { return true; }
      return (manager ? this.manager.hasController(aName) : false);
    }
  // #endregion hasController


  // #region Add controller if not exists
    void addController(IController aController) {
      if (aController) addController(aController.name, aController);
    }
    void addController(string aName, IController aController) {
      if (controllerContainer) controllerContainer.add(aName, aController);
    }
  // #endregion Add controller if not exists

  // #region Update existing controller
    bool updateController(IController aController) {
      return (aController ? updateController(aController.name, aController) : false);
    }
    bool updateController(string aName, IController aController) {
      if (aController) {
        controllerContainer.update(aName, aController);
        return true;
      }
      if (manager) { return manager.updateController(aName, aController); }

      return false;
    }
  // #endregion Update existing controller

  // #region Remove existing controller
    bool removeController(IController aController) {
      return (aController ? removeController(aController.name) : false);
    }
    bool removeController(string aName) {
      if (controllerContainer && hasController(aName)) {
        controllerContainer.remove(aName);
        return true;
      }
      if (manager) { return manager.removeController(aName); }

      return false;
    }
  // #endregion Remove existing controller
}