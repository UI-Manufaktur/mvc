/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.check;

import uim.mvc;
@safe:

class DControllerCheck : DControllerComponent, ICheck, ICheckManager {
  mixin(ControllerComponentThis!("ControllerCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .name("ControllerCheck");
  }

  mixin(TProperty!("ICheck[]", "checks"));  
  mixin CheckManagerTemplate;

  bool execute(STRINGAA options = null) {
    if (!manager) {
      this.error("manager_missing");
      debug writeln("In ControllerCheck -> manager_missing");
      return false; 
    }

    foreach(check; checks) {
      if (!check.manager(this.manager).execute(options)) {
        this
          .error(check.error)
          .redirectUrl(check.redirectUrl);
        return false;
      }
    }
   
    return true;
  }
}
mixin(ControllerComponentCalls!("ControllerCheck", "DControllerCheck"));

version(test_uim_mvc) { unittest {
	writeln("--- Test in ", __MODULE__, "/", __LINE__);

	assert(new DControllerCheck);
	assert(ControllerCheck);
	assert(new DControllerCheck(APPController));
	assert(ControllerCheck(APPController));
  }
}