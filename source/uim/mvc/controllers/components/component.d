/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
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

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
  }

  mixin(OProperty!("DController", "controller"));  

  // A component lookup table used to lazy load component objects.
  mixin(OProperty!("Json", "componentMap"));

  // Whether the config property has already been configured with defaults
  mixin(OProperty!("bool", "configInitialized"));

  // Component registry class used to lazy load components.
  mixin(OProperty!("DControllerComponentRegistry", "registry"));
}
mixin(ControllerComponentCalls!("ControllerComponent", "DControllerComponent"));

version(test_uim_mvc) { unittest {
  testControllerComponent(ControllerComponent, "ControllerComponent");

  assert(ControllerComponent.name == "ControllerComponent");
  assert(ControllerComponent.create.name == "ControllerComponent");
  assert(ControllerComponent.clone.name == "ControllerComponent");
}} 

/* * __debugInfo() public
Returns an array that can be used to describe the internal state of this object.

__get() public
Magic method for lazy loading $components.

_configDelete() protected
Deletes a single config key.

_configRead() protected
Reads a config key.

_configWrite() protected
Writes a config key.

configShallow() public
Merge provided config with existing config. Unlike config() which does a recursive merge for nested keys, this method does a simple merge.


getConfigOrFail() public
Returns the config for this specific key.

getController() public
Get the controller this component is bound to.

implementedEvents() public
Get the Controller callbacks this Component is interested in.

initialize() public
Constructor hook method.

log() public
Convenience method to write a message to Log. See Log::write() for more information on writing to logs.
*/ 

