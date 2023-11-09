/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.entities;

import uim.mvc;

@safe:
class DEntitiesPageController : DPageController {
  mixin(ControllerThis!("EntitiesPageController"));

  protected DEntity[] _entities;
  DEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  void entities(DEntity[] newEntities) {
    _entities = newEntities;
  }
  
  mixin(OProperty!("string", "entityName"));
  mixin(OProperty!("string", "sortBy"));
  mixin(OProperty!("string", "sortOrder"));
  mixin(OProperty!("string", "pageNo"));
  mixin(OProperty!("string", "entries"));
  mixin(OProperty!("string", "filterBy"));
  mixin(OProperty!("string", "filterValue"));

  override bool beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DPageController~":DPageController("~this.name~")::beforeResponse");
    if (!super.beforeResponse(options)) { 
      return false; 
    }
    
    this.entityName = options.get("entityName", null);
    this.sortBy = options.get("sortBy", null);
    this.sortOrder = options.get("sortOrder", null);
    this.pageNo = options.get("pageNo", null);
    this.entries = options.get("entries", null);
    this.filterBy = options.get("filterBy", null);
    this.filterValue = options.get("filterValue", null);

    return true;
  }
}
mixin(ControllerCalls!("EntitiesPageController"));

version(test_uim_mvc) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DEntitiesPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(EntitiesPageController); 
}}

