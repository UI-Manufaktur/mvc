/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.page;

@safe:
import uim.mvc;

class DPageController : DController, IPageController {
  mixin(ControllerThis!("PageController"));

  // Initialization (= hook method)
  override void initialize(Json configSettings = Json(null)) {
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

	/// layout for page
	ILayout _layout;
	O layout(this O)(ILayout newlayout) { 
    _layout = newlayout; 
    return cast(O)this; }
	auto layout() { 
    if (_layout) return _layout; 
    if (auto myController = cast(DPageController)this.controller) { return myController.layout; } 
    if (this.app) return this.app.layout; 
    return null; 
  }

  mixin(OProperty!("DETBCollection", "collection"));
  mixin(OProperty!("DEntity", "site"));
  mixin(OProperty!("DETBTenant", "tenant"));

  mixin(OProperty!("Session", "globalSession"));
  mixin(OProperty!("string[]", "pageActions"));
  mixin(OProperty!("bool", "hasGlobalSession"));
  mixin(OProperty!("IForm", "form"));

  mixin(OProperty!("IView", "view"));
  mixin(OProperty!("IView", "errorView"));

  // Required checks for the page flow
  mixin(OProperty!("string[]", "sessionData"));

  override DETBBase database() {
    if (_database) { return _database; } // has his own database
    if (this.controller && this.controller.database) { return this.controller.database; } // owner has database
    if (auto myApp = cast(IApplication)app) { return myApp.database; } // Leading app has database
    return null; // no database found
  }

  mixin(MVCParameter!("canonical")); 
  mixin(MVCParameter!("jsPath")); 
  mixin(MVCParameter!("pageTitle"));
  mixin(MVCParameter!("pageBreadcrumbs"));
  mixin(MVCParameter!("pgPath")); 
  mixin(MVCParameter!("title")); 

  DMVCRequestReader requestReader;
  DMVCSessionReader sessionReader;

  O pageActions(this O)(string[] actions...) { this.pageActions(actions); return cast(O)this; }
  O addPageActions(this O)(string[] actions...) { this.addPageActions(actions); return cast(O)this; }
  O addPageActions(this O)(string[] actions) { this.pageActions(this.pageActions~actions); return cast(O)this; }

  mixin(OProperty!("ViewModes", "viewMode")); // 0 - HTML , 1 - HTML & Javascript, 2 - PWA
  mixin(OProperty!("DataModes", "dataMode")); // 0 - HTML , 1 - HTML & Javascript, 2 - PWA
 
  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DPageController~":DPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);

    this.session = getAppSession(options);
    // ?? TODO if (appSession) { this.site(session.site); }
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

version(test_uim_mvc) { unittest {
  assert(PageController);
}}
