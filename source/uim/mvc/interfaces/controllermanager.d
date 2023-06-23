module uim.mvc.interfaces.controllermanager;

import uim.mvc;
@safe:

interface IControllerManager {
  IDatabase database();
  ILayoutManager layoutManager();
  ISessionManager sessionManager();

  void controllers(DControllerContainer aContainer); 
  DControllerContainer controllers(); 

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
