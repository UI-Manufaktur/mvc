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

  mixin CheckManagerTemplate;

  bool execute(STRINGAA options = null) {
    if (!manager) {
      this.error("manager_missing");
      // debugwriteln("In ControllerCheck -> manager_missing");
      return false; 
    }

    IControllerComponentManager myManager = this.manager;  
    foreach(myCheck; checks) {
      if (auto checkObj = (cast(DControllerCheck)myCheck)) {
        checkObj.manager(myManager);
        if (!checkObj.execute(options)) {
          this.error(checkObj.error);
          this.redirectUrl(checkObj.redirectUrl);
          return false;
        }
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