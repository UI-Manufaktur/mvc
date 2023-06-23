/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.DEntityBase", "entityBases.systems.passwords;

import uim.mvc;
@safe:

class DDatabaseHasPasswordsCheck : DDatabaseHasSystemsCheck {
  mixin(ControllerComponentThis!("DatabaseHasPasswordsCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=collection_passwords_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DDatabaseHasPasswordsCheck~":DDatabaseHasPasswordsCheck::check");
    if (!super.execute(options)) { return false; }

    if (!this.DEntityBase", "entityBase.hasCollection("systems", "system_passwords")) { // collection passwords missing 
      this.error("collection_passwords_missing");
      return false; 
    }
    
    return true;
  }
}
mixin(ControllerComponentCalls!("DatabaseHasPasswordsCheck"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DDatabaseHasPasswordsCheck);
    assert(DatabaseHasPasswordsCheck);
    assert(new DDatabaseHasPasswordsCheck(Controller));
    assert(DatabaseHasPasswordsCheck(Controller));
  }
}