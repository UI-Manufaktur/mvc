module uim.mvc.interfaces.controllermanager;

import uim.mvc;
@safe:

interface IControllerManager : ISessionManager {
  IEntityBase entityBase();

  void controllerContainer(DControllerContainer aContainer);
  DControllerContainer controllerContainer();

  void controllers(IController[string] someControllers);
  void controllers(IController[] someControllers...);
  void controllers(IController[] someControllers);
  
  IController[] controllers();
  string[] controllerNames();

  // set & get controller
  IController controller(string aName);
  void controller(IController aController);
  void controller(string aName, IController aController);

  void hasController(string aName); 

  void addController(IController aController); 
  void addController(string aName, IController aController);

  void updateController(string aName, IController aController); 
  void updateController(IController aController); 

  void removeController(string aName); 
}
