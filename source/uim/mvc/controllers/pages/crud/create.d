/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.crud.create;
/**************************************************/
/* This package contains general create page definitions */
/**************************************************/

import uim.mvc;
@safe:

class DAPPEntityCreateController : DAPPEntityCrudPageController {
  mixin(ControllerThis!("APPEntityCreateController"));

override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      // Checks to run for page request
      .checks([SessionExistsCheck, SessionHasHTTPSessionCheck, SessionHasSiteCheck])
      .view(APPEntityCreateView)
      .scripts
        .addLinks(
          "/js/apps/entities/entity.js", 
          "/js/apps/entities/create.js");
  }

/*   this(string newEntityName) {
    this()
    .entityName(newEntityName)
    .scripts.addLinks(
      "/js/apps/entities/"~entityName~"/entity.js",
      "/js/apps/entities/"~entityName~"/create.js");
  } */

  override bool beforeResponse(STRINGAA requestParameters) {
    debug writeln(moduleName!DAPPEntityCreateController~":DAPPEntityCreateController::beforeResponse");
    super.beforeResponse(requestParameters);   
    if ("redirect" in requestParameters) return;
    
    auto session = sessionManager.session(requestParameters);

    auto collection = database[session.site, collectionName]; 
    if (!collection) {
      requestParameters["redirect"] = "/";
      return; }

    this.entity(collection.toEntity(Json(null)));
    if (auto myView = cast(DEntityView)this.view) {
      myView.entity(this.entity);    
      
      auto poolId = uniform(1, 1_000_000_000);
      entityPool[poolId] = entity;
      requestParameters["entityPool"] = to!string(poolId);
    }
  }
}
mixin(ControllerCalls!("APPEntityCreateController"));
