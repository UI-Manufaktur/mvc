module uim.mvc.controllers.pages.page;

@safe:
import uim.mvc;

class DMVCPageController : DMVCController {
  mixin(MVCControllerThis!("MVCPageController"));

  mixin(OProperty!("DMVCView", "view"));
}
mixin(MVCControllerCalls!("MVCPageController", "DMVCPageController"));
