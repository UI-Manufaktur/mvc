module uim.mvc.controllers.validators.site;

import uim.mvc;

@safe:
class DValidatorSite : DValidator {
  mixin(ControllerThis!("ValidatorSite"));
  
  bool siteIdValid(string siteId) { return siteId.isUUID && UUID(siteId) != UUID(); }

  override DEntity validate(STRINGAA reqParameters) {
    // Looking for a siteId
    string internalSessionId = reqParameters.get("internalSessionId", "");
    auto mySession = cast(DSession)mySession.session(reqParameters);

/*     if (internalSession) { // internalSession exist
      auto site = internalSession.site;
      if (!site) { // No site. Try to read from reqParameters
        auto siteIdParameter = "";
        siteIdParameter = reqParameters.get("siteId", "");
        
        if (!siteIdParameter.isUUID && internalSession.session) { // not valid Id
          siteIdParameter = internalSession.session["siteId"]; }

        if (!siteIdParameter.isUUID) // No site id found
          return null;
        
        if (DEntityBase", "entityBase) { // Look into DEntityBase", "entityBase, site exists?
          auto dbSite = DEntityBase", "entityBase["systems", "system_sites"].findOne(UUID(siteIdParameter));
          if (dbSite) {
            // found site :-)
            dbSite.lastAccessedOn = toTimestamp(now);
            dbSite.save; // Update

            internalSession.site = site;
            return site;
          }        
        }
      }
    }
 */    
    return null; // Not valid ;
  }

  override Json message(Json json, STRINGAA parameters) {
    auto result = super.message(json, parameters);

    if(auto site = validate(parameters)) { // not validation error
      if ("results" !in result) result["results"] = Json.emptyObject; 
      result["results"]["site"] = site.toJson;
    }
    else { // not validation error
      auto error = Json.emptyObject;
      error["id"] = "007";
      error["message"] = "Site not found";
      result["errors"] ~= error;
    }
    return result;
  }
}
mixin(ControllerCalls!("ValidatorSite"));

