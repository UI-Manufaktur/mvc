/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.entity;

import uim.mvc;

@safe:
class DEntityPageController : DPageController {
  mixin(ControllerThis!("EntityPageController"));

  protected DEntity _entity;
  DEntity entity() { 
    return _entity; 
  }
  O entity(this O)(DEntity newEntity) { 
    _entity = newEntity;

    if (auto myView = cast(DEntityView)this.view) {
      myView.entity(this.entity);
    }
    
    return cast(O)this; 
  }

  mixin(OProperty!("string", "entityName"));

  override bool beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntityPageController~":DEntityPageController("~this.name~")::beforeResponse");
    if (!super.beforeResponse(options)) { 
      return false; 
    }
    
    this.entityName = options.get("entityName", null);

    return true;
  }
}
mixin(ControllerCalls!("EntityPageController"));

version(test_uim_mvc) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DEntityPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(EntityPageController); 
}}
