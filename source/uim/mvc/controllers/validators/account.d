/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.validators.account;

import uim.mvc;
@safe:

/* static this() {
  appErrorCodes[appErrorPrefix+100] = "Account id not valid or found";
} */

class DValidatorAccount : DValidator {
  mixin(ControllerThis!("ValidatorAccount"));

  override DEntity validate(STRINGAA reqParameters) {
    string mySessionId = reqParameters.get("mySessionId", "");
    auto mySession = cast(DSession)manager.session(reqParameters); 

    if (!manager) {
      this.error("manager_missing");
      return null; 
    }

    auto myEntityBase = manager.entityBase;
    if (!myEntityBase) {
      this.error("entitybase_missing");
      return null; 
    }
    
    // Looking for a accountId
    if (mySession) {
      auto account = mySession.account;
      if (!account) { // No account. Try to read from reqParameters
        auto accountIdParameter = "";
        if (!reqParameters.get("accountId", "").isUUID) // No valid loginId
          return null; // :-(

        accountIdParameter = reqParameters["accountId"];
        if (myEntityBase) { // Look into DEntityBase", "entityBase
          auto dbAccount = myEntityBase["systems", "system_accounts"].findOne(UUID(accountIdParameter));
          if (dbAccount) {
            // found account :-)
            dbAccount.lastAccessedOn = toTimestamp(now);
            dbAccount.save; // Update

            mySession.account = dbAccount;
            return account;
          }        
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

    if (auto account = validate(parameters)) { // not validation error
      if ("results" !in result) result["results"] = Json.emptyObject; 
      result["results"]["account"] = account.toJson;
    }
    else { // not validation error
      auto error = Json.emptyObject;
      error["id"] = 100;
      error["message"] = appErrorCodes[appErrorPrefix+100];
      result["errors"] ~= error;
    }
    return result;
  }
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}
}
mixin(ControllerCalls!("ValidatorAccount"));

