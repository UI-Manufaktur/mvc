module uim.mvc.controllers.actions.action;

@safe:
import uim.mvc;

class DMVCActionController : DMVCController {
  mixin(BKLControllerThis!("BKLActionController"));
}
mixin(BKLControllerCalls!("BKLActionController", "DMVCActionController"));