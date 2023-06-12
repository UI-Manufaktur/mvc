module uim.mvc.controllers.checks.internalsessions.account;

import uim.mvc;
@safe:

class DInternalSessionHasAccountCheck : DInternalSessionExistsCheck {
  mixin(ControllerComponentThis!("InternalSessionHasAccountCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .redirectUrl("/error?account_missing");
  }

  override bool execute(STRINGAA options = null) {    
    debug writeln(moduleName!DInternalSessionHasAccountCheck~":DInternalSessionHasAccountCheck::execute");
    if (!super.execute(options)) { return false; } 

    auto session = getInternalSession(options);
    if (!session.account) { // account missing 
      this.error("Account Missing");
      return false;
    }

    return true;
  }
}
mixin(ControllerComponentCalls!("InternalSessionHasAccountCheck"));
