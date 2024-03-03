/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.crud.elements;

import uim.mvc;

@safe:
class DMVCElementsForm : DForm {
  mixin(ViewComponentThis!("MVCElementsForm"));

  mixin(OProperty!("DElement[]", "elements"));

  override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);
  }
}
mixin(ViewComponentCalls!("MVCElementsForm", "DMVCElementsForm"));
