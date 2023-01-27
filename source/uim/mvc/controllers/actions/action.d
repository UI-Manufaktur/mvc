module uim.baklava.controllers.actions.action;

@safe:
import uim.baklava;

class DBKLActionController : DBKLController {
  mixin(BKLControllerThis!("BKLActionController"));
}
mixin(BKLControllerCalls!("BKLActionController", "DBKLActionController"));