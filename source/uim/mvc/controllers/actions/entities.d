module uim.mvc.controllers.actions.entities;

@safe:
import uim.mvc;

class DAPPEntitiesActionController : DActionController {
  mixin(ControllerThis!("APPEntitiesActionController"));

  protected DEntity[] _entities;
  DEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  void entities(DEntity[] newEntities) {
    _entities = newEntities;
  }
}
mixin(ControllerCalls!("APPEntitiesActionController"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(new APPEntitiesActionController);

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(APPEntitiesActionController);
}}