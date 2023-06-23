/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.DEntityBase", "entityBases.systems.sessions;

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

    debug writeln(this.DEntityBase", "entityBase ? "Database exists" : "Database missing");
    if (this.DEntityBase", "entityBase) debug writeln(this.DEntityBase", "entityBase.hasTenant("systems") ? "Tenant 'systems' exists" : "Tenant 'systems' missing");

    if (!this.DEntityBase", "entityBase.hasTenant("systems")) {
      debug writeln("tenant systsms missing"); }

    if (!this.DEntityBase", "entityBase["systems"].hasCollection("system_sessions")) { // collection sessions missing 
      this.error("collection_sessions_missing");
      return false; }
    
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