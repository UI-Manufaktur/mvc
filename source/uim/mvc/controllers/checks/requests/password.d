module uim.mvc.controllers.checks.requests.password;

@safe:
import uim.mvc;

class DControllerCheckRequestHasPassword : DControllerCheck {
  mixin(ControllerComponentThis!("APPCheckRequestHasPassword"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login");
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DControllerCheckRequestHasPassword~":DControllerCheckRequestHasPassword::execute");
    super.execute(options);

    if ("loginPW" !in options) { // loginPW  missing
      this.
        error("No loginPW in Request");
      return false; 
    }

    debug writeln("loginPW = ", options["loginPW"]);
    return true;
  }
}
mixin(ControllerComponentCalls!("APPCheckRequestHasPassword"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DControllerCheckRequestHasPassword);
    assert(APPCheckRequestHasPassword);
    assert(new DControllerCheckRequestHasPassword(Controller));
    assert(APPCheckRequestHasPassword(Controller));
  }
}
