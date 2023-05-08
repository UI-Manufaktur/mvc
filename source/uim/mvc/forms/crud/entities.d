/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.crud.entities;

import uim.mvc;
@safe:

class DMVCEntitiesForm : DForm {
  mixin(ViewComponentThis!("MVCEntitiesForm"));

  // mixin(OProperty!("DEntity[]", "entities"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
  }
}
mixin(ViewComponentCalls!("MVCEntitiesForm", "DMVCEntitiesForm"));
