module uim.mvc.controllers.checks.requests.accountname;

@safe:
import uim.mvc;

class DControllerCheckRequestHasAccountName : DControllerCheckDatabaseHasAccounts {
  mixin(ControllerComponentThis!("APPCheckRequestHasAccountName"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login");
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!APPCheckRequestHasAccountName~":APPCheckRequestHasAccountName::execute");
    if (!super.execute(options)) { return false; }

    if ("accountName" !in options) { // Account  missing
      this.error("request_accountname_missing");
      return false; 
    }

    debug writeln("accountName = ", options["accountName"]);
    return true;
  }
}
mixin(ControllerComponentCalls!("APPCheckRequestHasAccountName"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DControllerCheckRequestHasAccountName);
    assert(APPCheckRequestHasAccountName);
    assert(new DControllerCheckRequestHasAccountName(Controller));
    assert(APPCheckRequestHasAccountName(Controller));
  }
}
