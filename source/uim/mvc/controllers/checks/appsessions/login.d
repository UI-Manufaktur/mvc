module uim.mvc.controllers.checks.appsessions.login;

@safe:
import uim.mvc;

class DAppSessionHasLoginCheck : DAppSessionExistsCheck {
  mixin(ControllerComponentThis!("AppSessionHasLoginCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAppSessionHasLoginCheck~":DAppSessionHasLoginCheck::check");
    if (!super.execute(options)) { return false; }

    auto login = getAppSession(options).login;
    if (!login) { // login missing 
      this.error("appsession_login_missing");
      return false; 
    }

    debug writeln(moduleName!DAppSessionHasLoginCheck~":DAppSessionHasLoginCheck::check -> appSession.login found -> ", login.id);
    return true;
  }
}
mixin(ControllerComponentCalls!("AppSessionHasLoginCheck"));
