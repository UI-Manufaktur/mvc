/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.components.component;

@safe:
import uim.mvc;

class DControllerComponent : DMVCBase, IControllerComponent {
  mixin(ControllerComponentThis!("ControllerComponent"));

  mixin(OProperty!("IController", "controller"));  

  /**
    * Default config
    * These are merged with user-provided config when the component is used.
    */
  protected Json _defaultConfig = null;

  // Component registry class used to lazy load components.
  mixin(OProperty!("DControllerComponentRegistry", "registry"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    _defaultConfig = Json.emptyObject;
  }
}
mixin(ControllerComponentCalls!("ControllerComponent", "DControllerComponent"));

version(test_uim_mvc) { unittest {
  testControllerComponent(ControllerComponent, "ControllerComponent");

  assert(ControllerComponent.name == "ControllerComponent");
  assert(ControllerComponent.create.name == "ControllerComponent");
  assert(ControllerComponent.clone.name == "ControllerComponent");
}} 