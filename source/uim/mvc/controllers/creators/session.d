/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.creators.session;

import uim.mvc;

@safe:
class DMVCCreatorSession : DMVCCreator {
  mixin(ControllerThis!("MVCCreatorSession"));

/*   override DEntity createEntity(STRINGAA options) {
    auto entity = createEntities["session"](Json.emptyObject)
      .id(randomUUID)
      .name(options.get("session", "session"~to!string(now)));
    if (DEntityBase", "entityBase) DEntityBase", "entityBase["systems", "system_sessions"].insertOne(entity);        

    return entity;
  } */

  override Json message(Json json, STRINGAA options) {    
    auto result = super.message(json, options);

    if (auto session = createEntity(options)) {
      result["results"]["session"] = session.toJson;
    }
    else { // not validation error
      auto error = Json.emptyObject;
      error["id"] = "007";
      error["message"] = "Could not create session";
      result["errors"] ~= error;
    }
    return result; }
version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}
  }
mixin(ControllerCalls!("MVCCreatorSession"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    /// TODO 
  }}

