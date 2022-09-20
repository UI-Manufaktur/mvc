module uim.mvc.controllers.pages.page;

@safe:
import uim.mvc;

class DMVCPageController : DMVCController {
  mixin(MVCControllerThis!("MVCPageController"));

  mixin(OProperty!("DMVCView", "view"));

  // Containers
  mixin(OProperty!("DAPPLinkContainer", "links"));
  mixin(OProperty!("DAPPMetaContainer", "metas"));
  mixin(OProperty!("DAPPScriptContainer", "scripts"));
  mixin(OProperty!("DAPPStyleContainer", "styles"));
  
  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCPageController~":DMVCPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
  }    

  override void afterResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCPageController~":DMVCPageController::afterResponse");
    super.afterResponse(options);
  }  
}
mixin(MVCControllerCalls!("MVCPageController", "DMVCPageController"));
