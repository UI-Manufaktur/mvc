/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.crud.element;

@safe:
import uim.mvc;

class DMVCElementForm : DForm {
  mixin(ViewComponentThis!("MVCElementForm"));

  mixin(OProperty!("DElement", "element"));

  override void initialize() {
    super.initialize;
  }
}
mixin(ViewComponentCalls!("MVCElementForm", "DMVCElementForm"));
