/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.actions.create;

@safe:
import uim.mvc;

class DAPPCreateActionController : DActionController {
  mixin(ControllerThis!("APPCreateActionController"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings); 
    this.name = "APPCreateActionController";
    this.checks([APPCheckAppSessionExists, APPCheckDatabaseExists, APPCheckAppSessionHasSession, APPCheckAppSessionHasSite]); 
  }

  mixin(OProperty!("string", "pool"));
  mixin(OProperty!("string", "pgPath"));
  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCreateActionController~":DAPPCreateActionController::beforeResponse");
    super.beforeResponse(options);   
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto site = appSession.site;

    auto collection = database[site, pool];
    if (!collection) {
      options["redirect"] = pgPath~"/view"; 
      return; }

    auto entity = collection
      .createFromTemplate
      .fromRequest(options)
      .save; 

    options["redirect"] = pgPath~"/view?id="~entity.id.toString; 
  }
}
mixin(ControllerCalls!("APPCreateActionController"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DAPPCreateActionController);
  assert(APPCreateActionController);
  assert(APPCreateActionController.pool("testPool").pool == "testPool");
  assert(APPCreateActionController.pgPath("testPath").pgPath == "testPath");
    assert(APPCreateActionController.name == "APPCreateActionController");
  }
}
