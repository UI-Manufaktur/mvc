module uim.mvc.controllers.checks.sessions.account;

import uim.mvc;

@safe:
class DHasAccountCheck : DHasSessionCheck {
  mixin(ControllerComponentThis!("HasAccountCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .redirectUrl("/error?account_missing");
  }

  override bool execute(STRINGAA options = null) {    
    debug writeln(moduleName!DHasAccountCheck~":DHasAccountCheck::execute");
    if (!super.execute(options)) { return false; } 

    auto session = manager.session(options);
    if (!session.account) { // account missing 
      this.error("Account Missing");
      return false;
    }

    return true;
  }
}
mixin(ControllerComponentCalls!("HasAccountCheck"));
