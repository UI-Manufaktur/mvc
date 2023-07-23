module uim.mvc.interfaces.controllermanager;

import uim.mvc;
@safe:

interface IControllerManager : ISessionManager, IViewManager, ILayoutManager {
  IEntityBase entityBase();

  void controllerContainer(DControllerContainer aContainer);
  DControllerContainer controllerContainer();

  void addControllers(IController[string] someControllers);
  void addControllers(IController[] someControllers...);
  void addControllers(IController[] someControllers);
  
  IController[] controllers();
  string[] controllerNames();

  IController controller(string aName);

  bool hasController(IController aController); 
  bool hasController(string aName); 

  void addController(IController aController); 
  void addController(string aName, IController aController);

  bool updateController(string aName, IController aController); 
  bool updateController(IController aController); 

  bool removeController(IController aController); 
  bool removeController(string aName); 
}
