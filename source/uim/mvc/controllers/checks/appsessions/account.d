module uim.mvc.controllers.checks.appsessions.account;

@safe:
import uim.mvc;

class DAppSessionHasAccountCheck : DAppSessionExistsCheck {
  mixin(ControllerComponentThis!("AppSessionHasAccountCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .redirectUrl("/error?account_missing");
  }

  override bool execute(STRINGAA options = null) {    
    debug writeln(moduleName!DAppSessionHasAccountCheck~":DAppSessionHasAccountCheck::execute");
    if (!super.execute(options)) { return false; } 

    auto session = getAppSession(options);
    if (!session.account) { // account missing 
      this.error("Account Missing");
      return false;
    }

    return true;
  }
}
mixin(ControllerComponentCalls!("AppSessionHasAccountCheck"));
