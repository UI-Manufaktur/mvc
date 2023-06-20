module uim.mvc.controllers.checks.internalsessions.account;

import uim.mvc;
@safe:

class DSessionHasAccountCheck : DSessionExistsCheck {
  mixin(ControllerComponentThis!("SessionHasAccountCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .redirectUrl("/error?account_missing");
  }

  override bool execute(STRINGAA options = null) {    
    debug writeln(moduleName!DSessionHasAccountCheck~":DSessionHasAccountCheck::execute");
    if (!super.execute(options)) { return false; } 

    auto session = sessionManager.session(options);
    if (!session.account) { // account missing 
      this.error("Account Missing");
      return false;
    }

    return true;
  }
}
mixin(ControllerComponentCalls!("SessionHasAccountCheck"));
