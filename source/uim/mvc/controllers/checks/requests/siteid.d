module uim.mvc.controllers.checks.requests.siteid;

@safe:
import uim.mvc;

class DRequestHasSiteIdCheck : DDatabaseHasAccountsCheck {
  mixin(ControllerComponentThis!("RequestHasSiteIdCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login")
    .addChecks([RequestExistsCheck]);
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DRequestHasSiteIdCheck~":DRequestHasSiteIdCheck::execute");
    if (!super.execute(options)) { return false; }

    if ("siteId" !in options) { // siteId  missing
      this.
        error("No SiteId in Request");
      return false; 
    }

    debug writeln("SiteId = ", options["siteId"]);
    return true;
  }
}
mixin(ControllerComponentCalls!("RequestHasSiteIdCheck"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DRequestHasSiteIdCheck);
    assert(RequestHasSiteIdCheck);
    assert(new DRequestHasSiteIdCheck(Controller));
    assert(RequestHasSiteIdCheck(Controller));
  }
}