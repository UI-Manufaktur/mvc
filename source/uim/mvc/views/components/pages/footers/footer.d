/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.pages.footers.footer;

import uim.mvc;
@safe:

class DMVCPageFooterViewComponent : DViewComponent {
  mixin(ViewComponentThis!("MVCPageFooterViewComponent"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings); 
    
    this
      .inner = `Version 1.0.1 - Copyright 2017-2021 UI-Manufaktur UG (haftungsbeschränkt) - License MVC`;
  }
    
  mixin(MVCParameter!("backgroundColor"));
  mixin(MVCParameter!("backgroundImage"));
  mixin(MVCParameter!("inner"));

/*   mixin(OProperty!("DEntity",   "entity"));
  mixin(OProperty!("DEntity[]", "entities"));
 */
  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    debugMethodCall(moduleName!DMVCPageFooterViewComponent~":DMVCPageFooterViewComponent("~this.name~")::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }    
    
    auto rootPath = options.get("rootPath", "/");

    string style;
    if (backgroundColor) style ~= "background-color:"~backgroundColor~";";
    if (backgroundImage) style ~= "background-image:url("~backgroundImage~");"; 
    
    return [
      H5Footer(["py-5 bg-dark mt-2 fixed-bottom"], style ? ["style":style] : null, 
        BS5Container.fluid()(
          H5P(["m-0 text-center text-white"], inner)
        ))].toH5;
  }
}
mixin(ViewComponentCalls!("MVCPageFooterViewComponent", "DMVCPageFooterViewComponent"));
mixin(ViewComponentCalls!("MVCPageFooter", "DMVCPageFooterViewComponent"));
