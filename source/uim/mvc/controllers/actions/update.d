/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.actions.update;

import uim.mvc;

@safe:
class DUpdateActionController : DActionController {
  mixin(ControllerThis!("UpdateActionController"));

  override void initialize(Json[string] configSettings = null) {
    super.initialize(configSettings); 
    this.name = "UpdateActionController";
    this
      .addChecks(HasSessionCheck, DatabaseExistsCheck, HasHTTPSessionCheck, SessionHasSiteCheck); 
  }

  mixin(OProperty!("string", "pool"));
  mixin(OProperty!("string", "pgPath"));
  
  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DUpdateActionController~":DUpdateActionController::beforeResponse");
    super.beforeResponse(options);   
    if (hasError || "redirect" in options) { 
      return false; 
    }

    if (!manager) {
      this.error("manager_missing");
      return false; 
    }

    auto session = manager.session(options);
    auto site = session.site;

    auto myEntityBase = manager.entityBase;
    if (!myEntityBase) {
      this.error("entitybase_missing");
      return false; 
    }

    auto myCollection = myEntityBase[site, pool];
    if (!myCollection) {
      options["redirect"] = pgPath~"/view"; 
      return false; }

    if (auto myEntity = myCollection.createFromTemplate) {
      with (myEntity) {
        readFromRequest(options);
        save; 
      }

      options["redirect"] = pgPath~"/view?id="~myEntity.id.toString; 
    }

    return true;
  }
}
mixin(ControllerCalls!("UpdateActionController"));

version(test_uim_mvc) { unittest {
  writeln("--- Test in ", __MODULE__, "/", __LINE__);

  assert(new DUpdateActionController);
  assert(UpdateActionController);
  assert(UpdateActionController.pool("testPool").pool == "testPool");
  assert(UpdateActionController.pgPath("testPath").pgPath == "testPath");
  assert(UpdateActionController.name == "UpdateActionController");
}}

