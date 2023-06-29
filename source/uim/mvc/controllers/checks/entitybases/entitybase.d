/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.entitybases.entitybase;

import uim.mvc;
@safe:

class DDatabaseExistsCheck : DControllerCheck {
  mixin(ControllerComponentThis!("DatabaseExistsCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .redirectUrl("/error?message=entityBase_missing");
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DDatabaseExistsCheck~":DDatabaseExistsCheck::execute");
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
        
    return true;
  }
}
mixin(ControllerComponentCalls!("DatabaseExistsCheck"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    // TODO
  }
}