module uim.mvc.controllers.creators.creator;

@safe:
import uim.mvc;

class DMVCCreator : DController {
  mixin(ControllerThis!("MVCCreator"));

  DEntity createEntity(STRINGAA parameters = null) {
    return null;
  }
}
mixin(ControllerCalls!("MVCCreator"));
