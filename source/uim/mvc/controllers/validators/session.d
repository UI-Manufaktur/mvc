module uim.mvc.controllers.validators.session;

import uim.mvc;
@safe:

class DValidatorSession : DValidator {
  mixin(ControllerThis!("ValidatorSession"));
  
  override DEntity validate(STRINGAA reqParameters) {
    // Looking for a sessionId
    string internalSessionId = reqParameters.get("internalSessionId", "");
    auto internalSession = sessionManager.session(reqParameters);

    auto session = internalSession.session;
    if (!session) { // No session. Try to read from reqParameters
      auto sessionIdParameter = "";
      if (!reqParameters.get("sessionId", "").isUUID) // No valid loginId
        return null; // :-(

      sessionIdParameter = reqParameters["sessionId"];
      if (database) { // Look into database
        auto dbSession = database["systems", "system_sessions"].findOne(UUID(sessionIdParameter));
        if (dbSession) {
          // found session :-)
          dbSession.lastAccessedOn = toTimestamp(now);
          dbSession.save; // Update

          internalSession.session = dbSession;
          return dbSession;
        }        
      }
    }
    
    return null; // Not valid ;
  }

  override Json message(Json json, STRINGAA parameters) {
    auto result = super.message(json, parameters);

    if (auto session = validate(parameters)) { // not validation error
      if ("results" !in result) result["results"] = Json.emptyObject; 
      result["results"]["session"] = session.toJson;
    }
    else { // not validation error
      auto error = Json.emptyObject;
      error["id"] = "007";
      error["message"] = "SessionId not found";
      result["errors"] ~= error;
    }
    return result;
  }

  alias save = DEntity.save;
}
mixin(ControllerCalls!("ValidatorSession"));


