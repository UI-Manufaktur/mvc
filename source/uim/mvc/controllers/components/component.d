/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.components.component;

@safe:
import uim.mvc;

/**
* DControllerComponent
*
* Components are packages of logic that are shared between controllers. 
* This library comes with a set of core components you can use to aid in various common tasks. 
* You can also create your own components. If you find yourself wanting to copy and paste things between controllers, 
* you should consider creating your own component to contain the functionality. 
* Creating components keeps controller code clean and allows you to reuse code between different controllers.
**/
class DControllerComponent : DMVCObject, IControllerComponent {
  mixin(ControllerComponentThis!("ControllerComponent"));

  mixin(OProperty!("IController", "controller"));  

  // Component registry class used to lazy load components.
  mixin(OProperty!("DControllerComponentRegistry", "registry"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
  }
}
mixin(ControllerComponentCalls!("ControllerComponent", "DControllerComponent"));

version(test_uim_mvc) { unittest {
  testControllerComponent(ControllerComponent, "ControllerComponent");

  assert(ControllerComponent.name == "ControllerComponent");
  assert(ControllerComponent.create.name == "ControllerComponent");
  assert(ControllerComponent.clone.name == "ControllerComponent");
}} 