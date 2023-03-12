module uim.mvc.controllers.entities.entity;

@safe:
import uim.mvc;

class DAPPEntityController : DController {
  mixin(ControllerThis!("APPEntityController"));

  mixin(OProperty!("DEntity", "entity"));
}
mixin(ControllerCalls!("APPEntityController"));
