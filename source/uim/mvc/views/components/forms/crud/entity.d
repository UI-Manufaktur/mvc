/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.crud.entity;

@safe:
import uim.mvc;

class DMVCEntityForm : DForm {
  mixin(ViewComponentThis!("MVCEntityForm"));

  // mixin(OProperty!("DEntity", "entity"));

  override void initialize(Json configSetting = Json(null)) {
    super.initialize;
  }
}
mixin(ViewComponentCalls!("MVCEntityForm", "DMVCEntityForm"));
