/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.controllermanager;

import uim.mvc;
@safe:

// #region ControllerManager This
  string controllerManagerThis() {
    return "
  this() {}
    ";
  }

  template ControllerManagerThis() {
    const char[] ControllerManagerThis = controllerManagerThis();
  }
// #endregion ControllerManager This

// #region ControllerManager Calls
  string controllerManagerCalls() {
    return "
  auto ControllerManager() { return new DControllerManager(); }
    ";
  }

  template ControllerManagerCalls() {
    const char[] ControllerManagerCalls = controllerManagerCalls();
  }
// #endregion ControllerManager Calls

mixin template ControllerContainerTemplate() {
  // #region controllerContainer
    protected DControllerContainer _controllerContainer;  
    DControllerContainer controllerContainer() {
      if (_controllerContainer) {
        return _controllerContainer;
      }
      if (auto myManager = cast(IControllerManager)this.manager) {
        return myManager.controllerContainer;
      }
      return null; 
    }  
    void controllerContainer(DControllerContainer aControllerContainer) {    
      _controllerContainer = aControllerContainer;
    }  
  // #endregion controllerContainer
}

mixin template ControllerManagerTemplate() {
  // #region controllers
    void addControllers(IController[string] someControllers) {
      someControllers.byKeyValue.each!(kv => addController(kv.key, kv.value));
    }
    void addControllers(IController[] someControllers...) {
      addControllers(someControllers.dup);
    }
    void addControllers(IController[] someControllers) {
      someControllers.each!(col => addController(col));
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
    size_t countControllers() {
      return 
        (controllerContainer ? controllerContainer.length : 0);
    }
  // #endregion controllers

  // #region controller
    IController controller(string aName = null) {
      if (auto myController = (controllerContainer 
        ? (aName 
          ? controllerContainer[aName] 
          : null) 
        : null)) {
          return myController;          
        }
      if (manager) { return manager.controller(aName); } 

      return null;
    }   
  // #endregion controller
  
  // #region hasController
    bool hasController(IController aController) {
      return (aController ? hasController(aController.name) : false);
    }
    bool hasController(string aName) {
      return (controller(aName) ? true : false);
    }
  // #endregion hasController


  // #region Add controller 
    void addController(IController aController) {
      if (aController) addController(aController.name, aController);
    }
    void addController(string aName, IController aController) {
      if (aController) aController.manager(this);
      if (controllerContainer) {
        controllerContainer.add(aName, aController);
      }
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