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

  // For ICheck required
/*   override string redirectUrl() { return super.redirectUrl; }
  override IException exception() { return super.exception; } */

  bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DControllerCheck~":ControllerCheck::execute");
    if (!manager) {
      this.exception(CheckManagerMissingException(["DControllerCheck"]));
      return false; 
    }

    IControllerComponentManager myManager = this.manager;  
    foreach(myCheck; checks) {
      if (auto checkObj = (cast(DControllerCheck)myCheck)) {
        if (!checkObj.execute(options)) {
          if (auto myException = checkObj.exception) {
            _exception = myException;            
            if (auto myRedirectUrl = checkObj.redirectUrl) {
              this.redirectUrl(myRedirectUrl);
            }
            return false;
          }
          if (auto myRedirectUrl = checkObj.redirectUrl) {
            this.redirectUrl(myRedirectUrl);
            return false;
          }
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