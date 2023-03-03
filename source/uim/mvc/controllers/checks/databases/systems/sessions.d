/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.databases.systems.sessions;

@safe:
import uim.mvc;

class DDatabaseHasSessionsCheck : DDatabaseHasSystemsCheck {
  mixin(ControllerComponentThis!("DatabaseHasSessionsCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=collection_sessions_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DDatabaseHasSessionsCheck~":DDatabaseHasSessionsCheck::execute");
    if (!super.execute(options)) { return false; }

    debug writeln(this.database ? "Database exists" : "Database missing");
    if (this.database) debug writeln(this.database.hasTenant("systems") ? "Tenant 'systems' exists" : "Tenant 'systems' missing");

    if (!this.database.hasTenant("systems")) {
      debug writeln("tenant systsms missing"); }

    if (!this.database["systems"].hasCollection("system_sessions")) { // collection sessions missing 
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