/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.entities;

import uim.mvc;

@safe:
class DMVCEntitiesViewComponent : DViewComponent {
  mixin(ViewComponentThis!("MVCEntitiesViewComponent"));

  // mixin(OProperty!("DEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCEntitiesViewComponent~":DMVCEntitiesViewComponent("~this.name~")::beforeH5");
    super.beforeH5(options);
  }
}
mixin(ViewComponentCalls!("MVCEntitiesViewComponent", "DMVCEntitiesViewComponent"));
