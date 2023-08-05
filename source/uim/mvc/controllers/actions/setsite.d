/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.actions.setsite;

import uim.mvc;

@safe:
class DSelectSiteActionController : DActionController {
  mixin(ControllerThis!("SelectSiteActionController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings); 
    
    this.name = "SelectSiteActionController";
    this.addChecks(
      HasHTTPSessionCheck, // InternalSession Checks
      DatabaseHasSessionsCheck, DatabaseHasSitesCheck, // Database checks 
      RequestHasSiteIdCheck // Request Checks
    ); 
  }
  
  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DSelectSiteActionController~":DSelectSiteActionController::request");
    if (!super.beforeResponse(options) || "redirect" in options) return false;
        
    debug writeln(moduleName!DSelectSiteActionController~":DSelectSiteActionController::request - Working with InternalSession");
    DSession mySession = cast(DSession)manager.session(options); // DSession[string]
    
    debug writeln(moduleName!DSelectSiteActionController~":DSelectSiteActionController::request - Working with session.session");
    // HttpSession myHttpSession = mySession.session; 
    debug writeln(mySession ? "Found session" : "Missing session");
    
    auto myEntityBase = manager.entityBase;
    if (!myEntityBase) {
      debug writeln("No manager");
      return false;
    }
    
    auto myTenant = myEntityBase.entityTenant("systems");

    DEntity mySite = myTenant.collection("system_sites").findOne(["id":options.get("siteId", null)]);
    debug writeln(mySite ? "Found site" : "Missing site");

    if (mySession && mySite) {
      mySession
        .lastAccessedOn(toTimestamp(now()))
        .site(mySite)
        .save();
    }
    if (mySession) debug writeln(mySession.debugInfo);

    debug writeln(moduleName!DSelectSiteActionController~":DSelectSiteActionController::request - Redirect to /");
    options["redirect"] = "/";

    return true;
	}
}
mixin(ControllerCalls!("SelectSiteActionController"));