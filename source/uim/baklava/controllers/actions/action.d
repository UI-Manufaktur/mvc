module uim.baklava.controllers.actions.action;

@safe:
import uim.baklava;

class DBLVActionController : DBLVController {
  mixin(BLVControllerThis!("BLVActionController"));
}
mixin(BLVControllerCalls!("BLVActionController", "DBLVActionController"));