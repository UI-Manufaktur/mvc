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

  mixin(OProperty!("DEntityCollection", "logins"));
  mixin(OProperty!("DEntityCollection", "sessions"));
  mixin(OProperty!("DEntityCollection", "accounts"));
  mixin(OProperty!("DEntityCollection", "sites"));
  mixin(OProperty!("DEntityCollection", "passwords"));

  override bool beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DSystemActionController~":DSystemActionController("~this.name~")::beforeResponse");
    if (!super.beforeResponse(options) || hasError || "redirect" in options) { return false; }    
    
    // this.tenant(ETBNullTenant).collection(ETBNullCollection); // Clear

    if (!manager) {
      debug writeln("No manager");
      return false;
    }

    auto myEntityBase = manager.entityBase;
    if (!myEntityBase) {
      debug writeln("No manager");
      return false;
    }

    debug writeln("Found DEntityBase", "entityBase"); 
    if (auto myTenant = myEntityBase["systems"]) {
      // this.tenant(myTenant);
      this.logins(myTenant["system_logins"]);
      this.sessions(myTenant["system_sessions"]);
      this.accounts(myTenant["system_accounts"]);
      this.sites(myTenant["system_sites"]);
      this.passwords(myTenant["system_passwords"]);
    }

    return true;  
  }  
}
mixin(ControllerCalls!("SystemActionController"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(new DSystemActionController);

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(SystemActionController);
}}
