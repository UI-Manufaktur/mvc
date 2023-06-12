/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.crud.crud;

import uim.mvc;
@safe:

class DAPPEntityCrudPageController : DAPPEntityPageController {
  mixin(ControllerThis!("APPEntityCrudPageController"));

  override void beforeResponse(STRINGAA requestParameters) {
    debug writeln(moduleName!DAPPEntityCrudPageController~":DAPPEntityCrudPageController::beforeResponse");
    super.beforeResponse(requestParameters);   
    if ("redirect" in requestParameters) return;
    
    auto myInternalSession = sessionManager.session(requestParameters);

    auto collection = database[myInternalSession.site, collectionName]; 
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
mixin(ControllerCalls!("APPEntityCrudPageController"));
