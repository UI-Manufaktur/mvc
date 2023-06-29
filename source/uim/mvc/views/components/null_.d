/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.null_;

import uim.mvc;

@safe:
class DNullViewComponent : DViewComponent {
  mixin(ViewComponentThis!("NullViewComponent"));
  
  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings); 

/*     this */
/*     .isNull(true)  */
/*     .notNull(false);  */
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    return null;        
  }

  override string render(STRINGAA options = null) {
    return null; 
  }
}
mixin(ViewComponentCalls!("NullViewComponent", "DNullViewComponent"));

version(test_uim_mvc) { unittest {
  assert(NullViewComponent);
}}