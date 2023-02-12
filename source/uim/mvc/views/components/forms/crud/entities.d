/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.crud.entities;

@safe:
import uim.mvc;

class DMVCEntitiesForm : DForm {
  mixin(ViewComponentThis!("MVCEntitiesForm"));

  // mixin(OProperty!("DEntity[]", "entities"));

  override void initialize(DConfig configSetting = null) {
    super.initialize(configSettings);
  }
}
mixin(ViewComponentCalls!("MVCEntitiesForm", "DMVCEntitiesForm"));
