/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.validators.entity;

import uim.mvc;

@safe:
class DValidatorEntity : DValidator {
  mixin(ControllerThis!("ValidatorEntity"));
 
  override DEntity validate(STRINGAA reqParameters) {
    string mySessionId = reqParameters.get("internalSessionId", "");
    auto mySession = sessionManager.session(reqParameters);

    if (!manager) {
      this.error("manager_missing");
      return null; 
    }

    auto myEntityBase = manager.entityBase;
    if (!myEntityBase) {
      this.error("entitybase_missing");
      return null; 
    }

    // Looking for a entityId
    auto entity = mySession.entity;
    if (!entity) { // No entity. Try to read from reqParameters
      auto entityIdParameter = "";
      if (!reqParameters.get("entityId", "").isUUID) // No valid loginId
        return null; // :-(

      entityIdParameter = reqParameters["entityId"];
      if (myEntityBase) { // Look into DEntityBase", "entityBase
        auto dbEntity = myEntityBase["systems", "entitys"].findOne(UUID(entityIdParameter));
        if (dbEntity) {
          // found entity :-)
          dbEntity.lastAccessedOn = toTimestamp(now);
          dbEntity.save; // Update

          if (auto ses = cast(DSession)mySession) ses.entity = dbEntity;
          return dbEntity;
        }        
      }
    }
    
    return null; // Not valid ;
  }
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}

  override Json message(Json json, STRINGAA parameters) {
    auto result = super.message(json, parameters);

    auto myEntity = validate(parameters);
    if (myEntity) { // Error
      auto error = Json.emptyObject;
      error["id"] = "007";
      error["message"] = "EntityId not found";
      json["results"]["errors"] ~= error;
    }
    else result["results"]["entity"] = myEntity.toJson;
   
    return result;
  }
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}
}
mixin(ControllerCalls!("ValidatorEntity"));
