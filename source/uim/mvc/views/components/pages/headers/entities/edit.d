/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.pages.headers.entities.edit;

@safe:
import uim.mvc;

class DMVCEditPageHeaderViewComponent : DPageHeaderViewComponent {
  mixin(ViewComponentThis!("MVCEditPageHeaderViewComponent"));
  
  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .actions([["refresh"], ["list"], ["view"], ["print", "export"]]); 
  }
}
mixin(ViewComponentCalls!("MVCEditPageHeaderViewComponent", "DMVCEditPageHeaderViewComponent"));
mixin(ViewComponentCalls!("MVCEditPageHeader", "DMVCEditPageHeaderViewComponent"));
