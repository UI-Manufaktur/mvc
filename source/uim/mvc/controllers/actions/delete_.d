/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.actions.delete_;

import uim.mvc;

@safe:
class DDeleteActionController : DActionController {
  mixin(ControllerThis!("DeleteActionController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings); 
    this.name = "DeleteActionController";
    this.addChecks(SessionExistsCheck, DatabaseExistsCheck, SessionHasHTTPSessionCheck, SessionHasSiteCheck); 
  }

  mixin(OProperty!("string", "pool"));
  mixin(OProperty!("string", "pgPath"));
  
  override bool beforeResponse(STRINGAA options = null) {
    // debugwriteln(moduleName!DDeleteActionController~":DDeleteActionController::beforeResponse");
    if (!super.beforeResponse(options) || hasError || "redirect" in options) { return false; }

    auto session = manager.session(options);
    auto site = session.site;

    auto myCollection = manager.entityBase[site, pool];
    if (!myCollection) {
      options["redirect"] = pgPath~"/view"; 
      return false; }

    if (auto entity = myCollection.createFromTemplate) {
      with (entity) {
        readFromRequest(options);
        save; 
      }

      options["redirect"] = pgPath~"/view?id="~entity.id.toString; 
    }
    
    return true;
  }
}
mixin(ControllerCalls!("DeleteActionController"));

version(test_uim_mvc) { unittest {
  writeln("--- Test in ", __MODULE__, "/", __LINE__);

  assert(new DDeleteActionController);
  assert(DeleteActionController);
  assert(DeleteActionController.pool("testPool").pool == "testPool");
  assert(DeleteActionController.pgPath("testPath").pgPath == "testPath");
  assert(DeleteActionController.name == "DeleteActionController");
}}

