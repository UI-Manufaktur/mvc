module uim.mvc.controllers.checks.appsessions.account;

@safe:
import uim.mvc;

class DControllerCheckAppSessionHasAccount : DAppSessionExistsCheck {
  mixin(ControllerComponentThis!("AppSessionHasAccountCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .redirectUrl("/error?account_missing");
  }

  override bool execute(STRINGAA options = null) {    
    debug writeln(moduleName!DControllerCheckAppSessionHasAccount~":DControllerCheckAppSessionHasAccount::check");
    if (!super.execute(options)) { return false; } 

    auto appSession = getAppSession(options);
    if (!appSession.account) { // account missing 
      this.error("Account Missing");
      return false;
    }

    return true;
  }
}
mixin(ControllerComponentCalls!("AppSessionHasAccountCheck"));
