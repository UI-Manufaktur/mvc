/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.actions.system;

@safe:
import uim.mvc;

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

    this.tenant(ETBNullTenant).collection(ETBNullCollection); // Clear
    debug writeln("-0-");

    if (this.database) {
      debug writeln("Found database"); 

      this.tenant(database["systems"]);
      this.logins(this.tenant["system_logins"]);
      this.sessions(this.tenant["system_sessions"]);
      this.accounts(this.tenant["system_accounts"]);
      this.sites(this.tenant["system_sites"]);
      this.passwords(this.tenant["system_passwords"]);
    }  
  }
}
mixin(ControllerCalls!("SystemActionController"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(new DSystemActionController);

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(SystemActionController);
}}
