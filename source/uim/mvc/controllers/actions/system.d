/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.actions.system;

import uim.mvc;
@safe:

class DSystemActionController : DActionController {
  mixin(ControllerThis!("SystemActionController"));

  mixin(OProperty!("DETBCollection", "logins"));
  mixin(OProperty!("DETBCollection", "sessions"));
  mixin(OProperty!("DETBCollection", "accounts"));
  mixin(OProperty!("DETBCollection", "sites"));
  mixin(OProperty!("DETBCollection", "passwords"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DSystemActionController~":DSystemActionController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    
    
    // this.tenant(ETBNullTenant).collection(ETBNullCollection); // Clear
    debug writeln("-0-");

    if (auto myDatabase = (manager ? manager.database : null)) {
      debug writeln("Found database"); 
      if (auto myTenant = myDatabase["systems"]) {
        // this.tenant(myTenant);
        this.logins(myTenant["system_logins"]);
        this.sessions(myTenant["system_sessions"]);
        this.accounts(myTenant["system_accounts"]);
        this.sites(myTenant["system_sites"]);
        this.passwords(myTenant["system_passwords"]);
      }
    }  
  }
}
mixin(ControllerCalls!("SystemActionController"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(new DSystemActionController);

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(SystemActionController);
}}
