/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.page;

@safe:
import uim.mvc;

class DPageController : DController {
  mixin(ControllerThis!("PageController"));

  override void initialize(DConfigurationValue configSettings = null) {
    version(test_uim_mvc) { 
      debugMethodCall(moduleName!DPageController~"::DPageController("~this.name~"):initialize");   
    }
    super.initialize(configSettings);

    this
      .language("en") 
      .mimetype("text/html");
    
    requestReader = MVCRequestReader(this);
    sessionReader = MVCSessionReader(this);  
 
    this
      .links(MVCLinkContainer)
      .metas(MVCMetaContainer) 
      .scripts(MVCScriptContainer) 
      .styles(MVCStyleContainer); 
  }

  // Containers
  mixin(OProperty!("DMVCLinkContainer", "links"));
  mixin(OProperty!("DMVCMetaContainer", "metas"));
  mixin(OProperty!("DMVCScriptContainer", "scripts"));
  mixin(OProperty!("DMVCStyleContainer", "styles"));

  mixin(OProperty!("DLayout", "layout"));

  mixin(OProperty!("Session", "globalSession"));
  mixin(OProperty!("string[]", "pageActions"));
  mixin(OProperty!("bool", "hasGlobalSession"));

  mixin(OProperty!("DView", "view"));
  mixin(OProperty!("DView", "errorView"));

  // Required checks for the page flow
  mixin(OProperty!("string[]", "sessionData"));

  mixin(MVCParameter!("canonical")); 
  mixin(MVCParameter!("jsPath")); 
  mixin(MVCParameter!("pageTitle"));
  mixin(MVCParameter!("pageBreadcrumbs"));
  mixin(MVCParameter!("pgPath")); 
  mixin(MVCParameter!("title")); 

  DMVCRequestReader requestReader;
  DMVCSessionReader sessionReader;

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DPageController~":DPageController("~this.name~")::beforeResponse");
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
    debugMethodCall(moduleName!DPageController~":DPageController::afterResponse");
    super.afterResponse(options);
  }  
}
mixin(ControllerCalls!("PageController", "DPageController"));
