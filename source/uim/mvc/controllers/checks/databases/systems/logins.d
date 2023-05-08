/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.databases.systems.logins;

import uim.mvc;
@safe:

class DDatabaseHasLoginsCheck : DDatabaseHasSystemsCheck {
  mixin(ControllerComponentThis!("DatabaseHasLoginsCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=collection_logins_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DDatabaseHasLoginsCheck~":DDatabaseHasLoginsCheck::check");
    if (!super.execute(options)) { return false; }

    if (!this.database.hasCollection("systems", "system_logins")) { // collection logins missing 
      this.error("collection_logins_missing");
      return false; }
    
    return true;
  }
}
mixin(ControllerComponentCalls!("DatabaseHasLoginsCheck"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DDatabaseHasLoginsCheck);
    assert(DatabaseHasLoginsCheck);
    assert(new DDatabaseHasLoginsCheck(Controller));
    assert(DatabaseHasLoginsCheck(Controller));
  }
}