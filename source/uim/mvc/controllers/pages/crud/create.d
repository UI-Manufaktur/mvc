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
class DEntityCreateController : DEntityCrudPageController {
  mixin(ControllerThis!("EntityCreateController"));

override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    addChecks(SessionExistsCheck, SessionHasHTTPSessionCheck, SessionHasSiteCheck);
    addView(EntityCreateView);
    scripts
      .addLinks(
        "/js/apps/entities/entity.js", 
        "/js/apps/entities/create.js"
      );
  }

/*   this(string newEntityName) {
    this()
    .entityName(newEntityName)
    .scripts.addLinks(
      "/js/apps/entities/"~entityName~"/entity.js",
      "/js/apps/entities/"~entityName~"/create.js");
  } */

  override bool beforeResponse(STRINGAA requestParameters) {
    // debugwriteln(moduleName!DEntityCreateController~":DEntityCreateController::beforeResponse");
    if (!super.beforeResponse(requestParameters) || "redirect" in requestParameters) return false;
    
    auto mySession = manager.session(requestParameters);

    if (!manager) {
      this.error("manager_missing");
      return false; 
    }

    auto myEntityBase = manager.entityBase;
    if (!myEntityBase) {
      this.error("entitybase_missing");
      return false; 
    }
    
    auto collection = myEntityBase[mySession.site, collectionName]; 
    if (!collection) {
      requestParameters["redirect"] = "/";
      return false; }

    this.entity(collection.toEntity(Json(null)));
    if (auto myView = cast(DEntityView)this.view) {
      myView.entity(this.entity);    
      
      auto poolId = uniform(1, 1_000_000_000);
      entityPool[poolId] = entity;
      requestParameters["entityPool"] = to!string(poolId);
    }

    return true;
  }
}
mixin(ControllerCalls!("EntityCreateController"));
