/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.entitiesx.entities;

import uim.mvc;
@safe:

class DEntitiesViewComponent : DViewComponent {
  mixin(ViewComponentThis!("EntitiesViewComponent")); // , false, true));

  // mixin(OProperty!("DEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DView~":DView::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    debug writeln(entities ? "has entities" : "no entities");
  }
} 
mixin(ViewComponentCalls!("EntitiesViewComponent")); // , false, true));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    // TODO
  }
} 