/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.entitybases.systems.sessions;

import uim.mvc;
@safe:

class DDatabaseHasSessionsCheck : DDatabaseHasSystemsCheck {
  mixin(ControllerComponentThis!("DatabaseHasSessionsCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=collection_sessions_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DDatabaseHasSessionsCheck~":DDatabaseHasSessionsCheck::execute");
    if (!super.execute(options)) { return false; }

    if (!manager) {
      this.error("manager_missing");
      return false; 
    }

    auto myEntityBase = manager.entityBase;
    if (!myEntityBase) {
      this.error("entitybase_missing");
      return false; 
    }

    auto myTenant = myEntityBase.tenant("systems");
    if (myTenant is null) {
      this.error("tenant systems missing"); 
      return false;
    }

    auto myCollection = myTenant.collection("system_sessions");
    if (myCollection is null) { // collection sessions missing 
      this.error("collection_sessions_missing");
      return false; 
    }
    
    return true;
  }
}
mixin(ControllerComponentCalls!("DatabaseHasSessionsCheck"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DDatabaseHasSessionsCheck);
    assert(DatabaseHasSessionsCheck);
    assert(new DDatabaseHasSessionsCheck(Controller));
    assert(DatabaseHasSessionsCheck(Controller));
  }
}