/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.pages.bodies.body_;

import uim.mvc;

@safe:
class DPageBodyViewComponent : DViewComponent {
  mixin(ViewComponentThis!("PageBodyViewComponent"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
     
    return
      [
        UIMPageBody(id, ["mb-3"], 
          UIMCard(
            UIMCardBody(
              // add Content
            )
          )
        )
      ].toH5;
  }
}
mixin(ViewComponentCalls!("PageBodyViewComponent", "DPageBodyViewComponent"));
mixin(ViewComponentCalls!("MVCPageBody", "DPageBodyViewComponent"));
