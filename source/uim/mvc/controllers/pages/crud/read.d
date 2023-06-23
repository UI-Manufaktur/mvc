/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.crud.read;
/**************************************************/
/* This package contains general view page definitions */
/**************************************************/

import uim.mvc;
@safe:

class DAPPEntityReadController : DAPPEntityCrudPageController {
  mixin(ControllerThis!("APPEntityReadController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
    
    this
    .view(APPEntityReadView)
    .scripts
      .addLinks(
        "/js/apps/entities/entity.js", 
        "/js/apps/entities/view.js", // deprecated
        "/js/apps/entities/read.js");
  }

/*   this(string newEntityName) {
    this()
    .entityName(newEntityName)
    .scripts.addLinks(
      "/js/apps/entities/"~entityName~"/entity.js", 
      "/js/apps/entities/"~entityName~"/view.js", // deprecated
      "/js/apps/entities/"~entityName~"/read.js");
  } */

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPEntityReadController~":DAPPEntityReadController::beforeResponse");
    super.beforeResponse(options);   
    if ("redirect" in options) {
      // debug writeln("Redirect to "~options["redirect"]);
      return false;
    }

    auto mySession = sessionManager.session(options);
    if (mySession.isNull) { 
      options["redirect"] = "/";
      return false; 
    }

    if (!session.isValid(["session", "site"], options)) return false; 

    auto selector = options.toEntitySelect;
    debug writeln(moduleName!DAPPEntityReadController~":DAPPEntityReadController::beforeResponse - Selecting entity with ", selector);
    this.entity(DEntityBase", "entityBase[session.site, collectionName].findOne(options.toEntitySelect));
    if (!entity) {
      // TODO Errorhandling required
      return false;
    }

    auto poolId = uniform(1, 1_000_000_000);
    entityPool[poolId] = entity;
    options["entityPool"] = to!string(poolId);
  
    if (auto myView = cast(DEntityView)this.view) {
      myView.entity(this.entity);
    }

    return true;
  }
version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO
    }}
}
mixin(ControllerCalls!("APPEntityReadController"));
