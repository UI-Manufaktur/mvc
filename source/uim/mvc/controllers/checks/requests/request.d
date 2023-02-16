module uim.mvc.controllers.checks.requests.request;

@safe:
import uim.mvc;

class DControllerCheckRequestExists : DControllerCheck {
  mixin(ControllerComponentThis!("APPCheckRequestExists"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=request_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DControllerCheckRequestExists~":DControllerCheckRequestExists::check");
    if (!super.execute(options)) { return false; }

    if (!this.controller || !this.controller.request) { // Request missing 
      this
      .error("No Request found");
      return false;
    }

    return true;
  }
}
mixin(ControllerComponentCalls!("APPCheckRequestExists"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DControllerCheckRequestExists);
    assert(APPCheckRequestExists);
    assert(new DControllerCheckRequestExists(Controller));
    assert(APPCheckRequestExists(Controller));
  }
}
