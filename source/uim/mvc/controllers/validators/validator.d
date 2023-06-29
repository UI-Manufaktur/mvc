/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.validators.validator;

import uim.mvc;

@safe:
class DValidator : DController {
  mixin(ControllerThis!("Validator"));

  /// Main function of Controller
  DEntity validate(STRINGAA parameters) {
    return null; }
  version(test_uim_apps) {
    unittest {
      writeln("--- Test in ", __MODULE__, "/", __LINE__);
      
      /// TODO 
    }}

  override Json message(STRINGAA parameters) {
    return super.message(parameters); }
    version(test_uim_apps) {
      unittest {
        writeln("--- Test in ", __MODULE__, "/", __LINE__);

          /// TODO 
        }}

  override Json message(Json json, STRINGAA parameters) {    
    auto result = super.message(json, parameters);
    
    if ("results" !in result) result["results"] = Json.emptyObject; 
    
    return result; }
  }
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}
    
mixin(ControllerCalls!("Validator"));
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}
