module uim.baklava.controllers.actions.action;

@safe:
import uim.baklava;

class DMVCActionController : DMVCController {
  mixin(MVCControllerThis!("MVCActionController"));
}
mixin(MVCControllerCalls!("MVCActionController", "DMVCActionController"));