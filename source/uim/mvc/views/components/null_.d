/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.null_;

@safe:
import uim.mvc;

class DMVCNullComponent : DViewComponent {
  mixin(ViewComponentThis!("MVCNullComponent"));
  
  override void initialize(DConfigurationValue configSettings = null) {
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
mixin(ViewComponentCalls!("MVCNullComponent", "DMVCNullComponent"));

version(test_uim_mvc) { unittest {
  assert(MVCNullComponent);
}}