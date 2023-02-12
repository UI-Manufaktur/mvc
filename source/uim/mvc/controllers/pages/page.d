/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.page;

@safe:
import uim.mvc;

class DMVCPageController : DController {
  mixin(ControllerThis!("MVCPageController"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .language("en") 
      .mimetype("text/html");
    
/*     requestReader = MVCRequestReader(this);
    sessionReader = MVCSessionReader(this);  
 */
    this
      .links(MVCLinkContainer)
      .metas(MVCMetaContainer) 
      .scripts(MVCScriptContainer) 
      .styles(MVCStyleContainer); 
  }

  mixin(OProperty!("DView", "view"));

  // Containers
  mixin(OProperty!("DMVCLinkContainer", "links"));
  mixin(OProperty!("DMVCMetaContainer", "metas"));
  mixin(OProperty!("DMVCScriptContainer", "scripts"));
  mixin(OProperty!("DMVCStyleContainer", "styles"));

  mixin(OProperty!("DLayout", "layout"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCPageController~":DMVCPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
  }    

  override string stringResponse(string[string] options = null) {
    debugMethodCall(moduleName!DController~":DController::stringResponse");
    super.stringResponse(options);

    string result;
    if (view) result = view.render(options);
    if (auto myLayout = this.layout) {
      result = myLayout.render(this, result);  
    }
    else {
      result = this.application && this.application.layout ? this.application.layout.render(this, result) : result;  
    }

    return result;
  }

  override void afterResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCPageController~":DMVCPageController::afterResponse");
    super.afterResponse(options);
  }  
}
mixin(ControllerCalls!("MVCPageController", "DMVCPageController"));
