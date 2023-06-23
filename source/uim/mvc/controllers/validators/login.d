/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.validators.login;

import uim.mvc;
@safe:

class DValidatorLogin : DValidator {
  mixin(ControllerThis!("ValidatorLogin"));

  override DEntity validate(STRINGAA reqParameters) {
    string mySessionId = reqParameters.get("sessionId", "");
    auto mySession = cast(DSession)sessionManager.session(reqParameters);

    // Looking for a loginId
    auto login = mySession.login;
    if (login) { // No login. Try to read from reqParameters
      auto loginIdParameter = reqParameters.get("loginId", "");      

      if (!loginIdParameter.isUUID && mySession.session) { // No valid loginId, maybe in session
        loginIdParameter = mySession.session["loginId"]; }

      if (!loginIdParameter.isUUID) // No valid loginId
        return null; // :-(

      loginIdParameter = reqParameters["loginId"];
      if (DEntityBase", "entityBase) { // Look into DEntityBase", "entityBase
        auto dbLogin = DEntityBase", "entityBase["systems", "system_logins"].findOne(UUID(loginIdParameter));
        if (dbLogin) {
          // found login :-)
          dbLogin.lastAccessedOn = toTimestamp(now);
          dbLogin.save;
        
          mySession.login = dbLogin;
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

