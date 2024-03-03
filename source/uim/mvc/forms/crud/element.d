/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.crud.element;

import uim.mvc;

@safe:
class DMVCElementForm : DForm {
  mixin(ViewComponentThis!("MVCElementForm"));

  mixin(OProperty!("DElement", "element"));

  override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);
  }
}
mixin(ViewComponentCalls!("MVCElementForm", "DMVCElementForm"));
