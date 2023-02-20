module uim.mvc.controllers.checks.appsessions.site;

@safe:
import uim.mvc;

class DAppSessionHasSiteCheck : DAppSessionExistsCheck {
  mixin(ControllerComponentThis!("AppSessionHasSiteCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAppSessionHasSiteCheck~":DAppSessionHasSiteCheck::check");
    if (!super.execute(options)) { return false; }

    auto site = getAppSession(options).site;
    if (!site) { 
      this.error("appsession_site_missing");
      return false; 
    }

    debug writeln(moduleName!DAppSessionHasSiteCheck~":DAppSessionHasSiteCheck::check -> session.site found -> ", site.id);
    return true;
  }
}
mixin(ControllerComponentCalls!("AppSessionHasSiteCheck"));
