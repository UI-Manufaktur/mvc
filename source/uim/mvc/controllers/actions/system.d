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

  mixin(OProperty!("IEntityCollection", "logins"));
  mixin(OProperty!("IEntityCollection", "sessions"));
  mixin(OProperty!("IEntityCollection", "accounts"));
  mixin(OProperty!("IEntityCollection", "sites"));
  mixin(OProperty!("IEntityCollection", "passwords"));

  override bool beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DSystemActionController~":DSystemActionController("~this.name~")::beforeResponse");
    if (!super.beforeResponse(options)) { return false; }    
    
    // this.tenant(ETBNullTenant).collection(ETBNullCollection); // Clear

    if (!manager) {
      debug writeln("No manager");
      return false;
    }

    auto myEntityBase = manager.entityBase;
    if (!myEntityBase) {
      debug writeln("No entityBase");
      return false;
    }
    debug writeln("Found entityBase"); 

    auto myTenant = myEntityBase.tenant("systems");
    if (!myTenant) {
      debug writeln("No tenant");
      return false;
    }
    debug writeln("Found tenant"); 

    // this.tenant(myTenant);
    this.logins(myTenant.collection("system_logins"));
    this.sessions(myTenant.collection("system_sessions"));
    this.accounts(myTenant.collection("system_accounts"));
    this.sites(myTenant.collection("system_sites"));
    this.passwords(myTenant.collection("system_passwords"));

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
