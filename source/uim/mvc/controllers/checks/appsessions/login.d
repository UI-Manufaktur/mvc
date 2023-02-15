module uim.mvc.controllers.checks.appsessions.login;

@safe:
import uim.mvc;

class DControllerCheckAppSessionHasLogin : DControllerCheckAppSessionExists {
  mixin(ControllerComponentThis!("APPCheckAppSessionHasLogin"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DControllerCheckAppSessionHasLogin~":DControllerCheckAppSessionHasLogin::check");
    if (!super.execute(options)) { return false; }

    auto login = getAppSession(options).login;
    if (!login) { // login missing 
      this.error("appsession_login_missing");
      return false; 
    }

    debug writeln(moduleName!DControllerCheckAppSessionHasLogin~":DControllerCheckAppSessionHasLogin::check -> appSession.login found -> ", login.id);
    return true;
  }
}
mixin(ControllerComponentCalls!("APPCheckAppSessionHasLogin"));
