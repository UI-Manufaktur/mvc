/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.actions.create;

import uim.mvc;
@safe:

class DCreateActionController : DActionController {
  mixin(ControllerThis!("CreateActionController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings); 
    this.name = "CreateActionController";
    this.checks([SessionExistsCheck, DatabaseExistsCheck, SessionHasHTTPSessionCheck, SessionHasSiteCheck]); 
  }

  mixin(OProperty!("string", "pool"));
  mixin(OProperty!("string", "pgPath"));
  
  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DCreateActionController~":DCreateActionController::beforeResponse");
    if (!super.beforeResponse(options) || hasError || "redirect" in options) return false; 

    auto mySession = sessionManager.session(options);
    if (mySession.isNull) {
      options["redirect"] = "/login"; 
      return false; // TODO: Redirect to login 
    }

    auto mySite = mySession.site;
    if (mySite.isNull) { 
      options["redirect"] = "/sites"; 
      return false; // TODO: Redirect to login 
    }

    if (manager.isNull) return false; 

    if (auto myDatabase = manager.database) {
      if (auto myTenant = myDatabase[mySite]) {
        if (auto collection = myTenant[pool]) {
          if (auto entity = collection.createFromTemplate) {
            with (entity) {
              readFromRequest(options);
              save; 
            }

            options["redirect"] = pgPath~"/view?id="~entity.id.toString; 
            return false;
          }
        }
      }
    }
    options["redirect"] = pgPath~"/view"; 

    return true;
  }
}
mixin(ControllerCalls!("CreateActionController"));

version(test_uim_mvc) { unittest {
  writeln("--- Test in ", __MODULE__, "/", __LINE__);

  assert(new DCreateActionController);
  assert(CreateActionController);
  assert(CreateActionController.pool("testPool").pool == "testPool");
  assert(CreateActionController.pgPath("testPath").pgPath == "testPath");
  assert(CreateActionController.name == "CreateActionController");
}}

