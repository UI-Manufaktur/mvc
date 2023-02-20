module uim.mvc.controllers.checks.appsessions.appsession;

@safe:
import uim.mvc;

class DAppSessionExistsCheck : DControllerCheck {
  mixin(ControllerComponentThis!("AppSessionExistsCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/account");
  }

  override bool execute(STRINGAA options = null) {    
    debug writeln(moduleName!DAppSessionExistsCheck~":DAppSessionExistsCheck::check");

    auto session = getAppSession(options);
    if (!appSession) { // appsession missing 
      this.error("appsession_missing");
      return false; 
    }

    return true;
  }
}
mixin(ControllerComponentCalls!("AppSessionExistsCheck"));
