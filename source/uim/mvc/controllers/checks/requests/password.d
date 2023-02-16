module uim.mvc.controllers.checks.requests.password;

@safe:
import uim.mvc;

class DRequestHasPasswordCheck : DControllerCheck {
  mixin(ControllerComponentThis!("RequestHasPasswordCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login");
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DRequestHasPasswordCheck~":DRequestHasPasswordCheck::execute");
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
mixin(ControllerComponentCalls!("RequestHasPasswordCheck"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DRequestHasPasswordCheck);
    assert(RequestHasPasswordCheck);
    assert(new DRequestHasPasswordCheck(Controller));
    assert(RequestHasPasswordCheck(Controller));
  }
}
