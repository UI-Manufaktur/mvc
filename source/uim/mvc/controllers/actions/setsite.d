/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.actions.setsite;

@safe:
import uim.mvc;

class DAPPSelectSiteActionController : DActionController {
  mixin(ControllerThis!("APPSelectSiteActionController"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings); 
    
    this.name = "APPSelectSiteActionController";
    this.checks([
      AppSessionHasSessionCheck, // AppSession Checks
      DatabaseHasSessionsCheck, DatabaseHasSitesCheck, // Database checks 
      RequestHasSiteIdCheck // Request Checks
    ]); 
  }
  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPSelectSiteActionController~":DAPPSelectSiteActionController::request");
    super.beforeResponse(options);
    if ("redirect" in options) return;
        
    debug writeln(moduleName!DAPPSelectSiteActionController~":DAPPSelectSiteActionController::request - Working with AppSession");
    auto appSession = getAppSession(options);
    
    debug writeln(moduleName!DAPPSelectSiteActionController~":DAPPSelectSiteActionController::request - Working with AppSession.session");
    auto session = appSession.session; 
    debug writeln(session ? "Found session" : "Missing session");

    auto site = database["systems"]["system_sites"].findOne(["id":options.get("siteId", null)]);
    debug writeln(site ? "Found site" : "Missing site");

    if (session && site) {
      session.lastAccessedOn = toTimestamp(now());
      session["lastAccessISO"] = now.toISOString;
      session["siteId"] = site.id.toString;
      session.save;
      appSession.session = session; 
    
      debug writeln(moduleName!DAPPSelectSiteActionController~":DAPPSelectSiteActionController::request - Working with AppSession.site");
      site.lastAccessedOn = session.lastAccessedOn;
      site["lastAccessISO"] = session["lastAccessISO"];
      site.save; 
      appSession.site = site; 
      setAppSession(appSession, options); 
    }

    debug writeln(moduleName!DAPPSelectSiteActionController~":DAPPSelectSiteActionController::request - Redirect to /");
    options["redirect"] = "/";
    debug writeln(appSession.debugInfo);
	}
}
mixin(ControllerCalls!("APPSelectSiteActionController"));