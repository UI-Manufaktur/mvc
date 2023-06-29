/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.controllercomponentmanager;

import uim.mvc;
@safe:

interface IControllerComponentManager {
  void controllerComponentContainer(DControllerComponentContainer aContainer);
  DControllerComponentContainer controllerComponentContainer();

  void controllerComponents(IControllercomponent[string] someControllerComponents);
  void controllerComponents(IControllerComponent[] someControllerComponents);
  IControllerComponent[] controllerComponents();
  string[] controllerComponentNames();

  // set & get controllerComponent
  IControllerComponent controllerComponent(string aName);
  void controllerComponent(IControllerComponent aControllerComponent);
  void controllerComponent(string aName, IControllerComponent aControllerComponent);

  // Check existing controllerComponent
  bool hasControllerComponent(IControllerComponent aControllerComponent);
  bool hasControllerComponent(string aName);

  IControllerComponent controllerComponent(string aName = null);

  void addControllerComponentss(IControllerComponent[] somecontrollerComponents...);
  void addControllerComponentss(IControllerComponent[] somecontrollerComponents);

  void addControllerComponentss(IControllerComponent[string] somecontrollerComponents);

  void addControllerComponents(IControllerComponent aControllerComponent);
  void addControllerComponents(string aName, IControllerComponent aControllerComponent);

  void updatecontrollerComponent(string aName, IControllerComponent aControllerComponent);

  void removecontrollerComponent(string aName);
}