/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.crud.crud;

import uim.mvc;

@safe:
class DEntityCrudPageController : DEntityPageController {
  mixin(ControllerThis!("EntityCrudPageController"));

  override bool beforeResponse(STRINGAA requestParameters) {
    // debugwriteln(moduleName!DEntityCrudPageController~":DEntityCrudPageController::beforeResponse");
    if (!super.beforeResponse(requestParameters) || ("redirect" in requestParameters)) return false;
    
    auto myInternalSession = manager.session(requestParameters);

    if (!manager) {
      this.error("manager_missing");
      return false; 
    }

    auto myEntityBase = manager.entityBase;
    if (!myEntityBase) {
      this.error("entitybase_missing");
      return false; 
    }

    auto collection = myEntityBase[myInternalSession.site, collectionName]; 
    if (!collection) {
      requestParameters["redirect"] = "/";
      return false; 
    }

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
mixin(ControllerCalls!("EntityCrudPageController"));
