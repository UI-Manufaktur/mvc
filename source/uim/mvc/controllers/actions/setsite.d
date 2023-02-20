/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.actions.setsite;

@safe:
import uim.mvc;

class DSelectSiteActionController : DActionController {
  mixin(ControllerThis!("SelectSiteActionController"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings); 
    
    this.name = "SelectSiteActionController";
    this.checks([
      AppSessionHasSessionCheck, // AppSession Checks
      DatabaseHasSessionsCheck, DatabaseHasSitesCheck, // Database checks 
      RequestHasSiteIdCheck // Request Checks
    ]); 
  }
  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DSelectSiteActionController~":DSelectSiteActionController::request");
    super.beforeResponse(options);
    if ("redirect" in options) return;
        
    debug writeln(moduleName!DSelectSiteActionController~":DSelectSiteActionController::request - Working with AppSession");
    auto myAppSession = getAppSession(options);
    
    debug writeln(moduleName!DSelectSiteActionController~":DSelectSiteActionController::request - Working with session.session");
    auto myHttpSession = myAppSession.session; 
    debug writeln(myHttpSession ? "Found session" : "Missing session");

    auto site = database["systems"]["system_sites"].findOne(["id":options.get("siteId", null)]);
    debug writeln(site ? "Found site" : "Missing site");

    if (myAppSession && site) {
      myAppSession.lastAccessedOn = toTimestamp(now());
      myAppSession["lastAccessISO"] = now.toISOString;
      myAppSession["siteId"] = site.id.toString;
      // myAppSession.save; // Save to Store
      myAppSession.session = session; 
    
      debug writeln(moduleName!DSelectSiteActionController~":DSelectSiteActionController::request - Working with session.site");
      site.lastAccessedOn = myAppSession.lastAccessedOn;
      site["lastAccessISO"] = myAppSession["lastAccessISO"];
      site.save; 
      myAppSession.site = site; 
      setAppSession(myAppSession, options); 
    }

    debug writeln(moduleName!DSelectSiteActionController~":DSelectSiteActionController::request - Redirect to /");
    options["redirect"] = "/";
    debug writeln(session.debugInfo);
	}
}
mixin(ControllerCalls!("SelectSiteActionController"));