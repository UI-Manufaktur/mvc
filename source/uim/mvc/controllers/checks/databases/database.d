/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.databases.database;

@safe:
import uim.mvc;

class DDatabaseExistsCheck : DControllerCheck {
  mixin(ControllerComponentThis!("DatabaseExistsCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=database_missing");
  }
  
  // Secure shortcut to this.database
  auto database() {
    return this.controller ? this.controller.database : null;
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DDatabaseExistsCheck~":DDatabaseExistsCheck::execute");
    if (!super.execute(options)) { return false; }

    if (!this.controller) debug writeln("Controller missing");
        
    if (!this.database) { // database missing 
      this.error("database_missing");
      return false;
    }
    return true;
  }
}
mixin(ControllerComponentCalls!("DatabaseExistsCheck"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    // TODO
  }
}