module uim.mvc.controllers.actions.action;

@safe:
import uim.mvc;

class DBKLActionController : DBKLController {
  mixin(BKLControllerThis!("BKLActionController"));
}
mixin(BKLControllerCalls!("BKLActionController", "DBKLActionController"));