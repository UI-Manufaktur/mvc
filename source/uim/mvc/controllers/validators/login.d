module uim.mvc.controllers.validators.login;

import uim.mvc;
@safe:

class DValidatorLogin : DValidator {
  mixin(ControllerThis!("ValidatorLogin"));

  override DEntity validate(STRINGAA reqParameters) {
    string internalSessionId = reqParameters.get("internalSessionId", "");
    auto internalSession = sessionManager.session(reqParameters);

    // Looking for a loginId
    auto login = internalSession.login;
    if (login) { // No login. Try to read from reqParameters
      auto loginIdParameter = reqParameters.get("loginId", "");      

      if (!loginIdParameter.isUUID && internalSession.session) { // No valid loginId, maybe in session
        loginIdParameter = internalSession.session["loginId"]; }

      if (!loginIdParameter.isUUID) // No valid loginId
        return null; // :-(

      loginIdParameter = reqParameters["loginId"];
      if (database) { // Look into database
        auto dbLogin = database["systems", "system_logins"].findOne(UUID(loginIdParameter));
        if (dbLogin) {
          // found login :-)
          dbLogin.lastAccessedOn = toTimestamp(now);
          dbLogin.save;
        
          internalSession.login = dbLogin;
          return dbLogin;
        }        
      }
    }
    
    return null; // Not valid
  }
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}

  override Json message(Json json, STRINGAA reqParameters) {
    auto result = super.message(json, reqParameters);

    if (auto login = validate(reqParameters)) { // no validation error :-)
      if ("results" !in result) result["results"] = Json.emptyObject; 
      result["results"]["login"] = login.toJson;
    }
    else { // validation error :-(
      auto error = Json.emptyObject;
      error["id"] = "007";
      error["message"] = "Login not found";
      result["errors"] ~= error;
    }
    return result;
  }
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}
}
mixin(ControllerCalls!("ValidatorLogin"));

