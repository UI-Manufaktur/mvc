/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.static_;

import uim.mvc;

@safe:
class DStaticViewComponent : DViewComponent {
  mixin(ViewComponentThis!("StaticViewComponent"));

  mixin(OProperty!("DH5Obj[]", "h5"));

  override DH5Obj[] toH5(STRINGAA options) {
    return this.h5;
  }
}
mixin(ViewComponentCalls!("StaticViewComponent", "DStaticViewComponent"));
