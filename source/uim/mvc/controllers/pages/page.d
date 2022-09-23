module uim.mvc.controllers.pages.page;

@safe:
import uim.mvc;

class DMVCPageController : DMVCController {
  mixin(MVCControllerThis!("MVCPageController"));

  override void initialize() {
    super.initialize;

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

  mixin(OProperty!("DMVCView", "view"));

  // Containers
  mixin(OProperty!("DMVCLinkContainer", "links"));
  mixin(OProperty!("DMVCMetaContainer", "metas"));
  mixin(OProperty!("DMVCScriptContainer", "scripts"));
  mixin(OProperty!("DMVCStyleContainer", "styles"));
  
  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCPageController~":DMVCPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
  }    

  override string stringResponse(string[string] options = null) {
    debugMethodCall(moduleName!DMVCController~":DMVCController::stringResponse");
    super.stringResponse(options);

    string result;
    if (view) result = view.render(options);
    if (this.application && this.application.layout) {
      
    }

    return result;
  }

  override void afterResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCPageController~":DMVCPageController::afterResponse");
    super.afterResponse(options);
  }  
}
mixin(MVCControllerCalls!("MVCPageController", "DMVCPageController"));
