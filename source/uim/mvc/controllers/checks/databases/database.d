/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.databases.database;

import uim.mvc;
@safe:

class DDatabaseExistsCheck : DControllerCheck {
  mixin(ControllerComponentThis!("DatabaseExistsCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=database_missing");
  }
  
  // Secure shortcut to this.database
  auto database() {
    if (!this.manager) return null;

    if (auto myController = cast(DController)this.manager) { // 1 Level
      return myController.manager ? myController.manager.database : null;
    }
    if (auto myControllerComponent = cast(DControllerComponent)this.manager) { // 2 Level
      if (auto myController = cast(DController)myControllerComponent.manager) {
        return myController.manager ? myController.manager.database : null;
      }
    }
    return null;
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DDatabaseExistsCheck~":DDatabaseExistsCheck::execute");
    if (!super.execute(options)) { return false; }

    if (!this.manager) debug writeln("Manager missing");
        
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