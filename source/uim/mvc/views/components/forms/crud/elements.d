/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.crud.elements;

@safe:
import uim.mvc;

class DMVCElementsForm : DForm {
  mixin(ViewComponentThis!("MVCElementsForm"));

  mixin(OProperty!("DElement[]", "elements"));

  override void initialize(DConfig configSettings = null) {
    super.initialize(configSettings);
  }
}
mixin(ViewComponentCalls!("MVCElementsForm", "DMVCElementsForm"));
