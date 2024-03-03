/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.pages.headers.entities.index;

import uim.mvc;

@safe:
class DMVCIndexPageHeaderViewComponent : DPageHeaderViewComponent {
  mixin(ViewComponentThis!("MVCIndexPageHeaderViewComponent"));

  override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);
    
    this
      .actions([["refresh", "create"]]); 
  }
}
mixin(ViewComponentCalls!("MVCIndexPageHeaderViewComponent", "DMVCIndexPageHeaderViewComponent"));
mixin(ViewComponentCalls!("MVCIndexPageHeader", "DMVCIndexPageHeaderViewComponent"));
