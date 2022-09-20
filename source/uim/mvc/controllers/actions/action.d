module uim.mvc.controllers.actions.action;

@safe:
import uim.mvc;

class DMVCActionController : DMVCController {
  mixin(MVCControllerThis!("MVCActionController"));
}
mixin(MVCControllerCalls!("MVCActionController", "DMVCActionController"));