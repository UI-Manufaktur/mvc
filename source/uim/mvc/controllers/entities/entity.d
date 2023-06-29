module uim.mvc.controllers.entities.entity;

import uim.mvc;

@safe:
class DEntityController : DController {
  mixin(ControllerThis!("EntityController"));

  mixin(OProperty!("DEntity", "entity"));
}
mixin(ControllerCalls!("EntityController"));
