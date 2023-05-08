/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.entitiesx.table;

import uim.mvc;
@safe:

/* class DAPPEntitiesTableViewComponent : DViewComponent {
  mixin(ViewComponentThis!("APPEntitiesTableViewComponent", false, true));

  mixin(OProperty!("DAPPTableViewComponent", "tableComponent"));

override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .tableComponent(APPTableViewComponent);
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DForm~":DForm("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DForm~":DForm("~this.name~")::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

    return tableComponent.toH5(options);
  }  
} 
mixin(ViewComponentCalls!("APPEntitiesTableViewComponent", false, true));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    // TODO
  }
} */