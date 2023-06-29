module uim.mvc.controllers.entities.entity;

import uim.mvc;

@safe:
class DAPPEntityController : DController {
  mixin(ControllerThis!("APPEntityController"));

  mixin(OProperty!("DEntity", "entity"));
}
mixin(ControllerCalls!("APPEntityController"));
