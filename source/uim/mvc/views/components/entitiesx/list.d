/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.entitiesx.list;

@safe:
import uim.mvc;

/* class DAPPEntitiesListViewComponent : DViewComponent {
  mixin(ViewComponentThis!("APPEntitiesListViewComponent", false, true));

  mixin(OProperty!("DAPPListViewComponent", "listComponent"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .listComponent(APPListViewComponent);
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

    return listComponent.toH5(options);
  }  
} 
mixin(ViewComponentCalls!("APPEntitiesListViewComponent", false, true));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    // TODO
  }
} */