module uim.mvc.controllers.checks.databases.systems.accounts;

@safe:
import uim.mvc;

class DDatabaseHasAccountsCheck : DDatabaseHasSystemsCheck {
  mixin(ControllerComponentThis!("DatabaseHasAccountsCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=collection_accounts_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DDatabaseHasAccountsCheck~":DDatabaseHasAccountsCheck::check");
    if (!super.execute(options)) { return false; }

    if (!this.database.hasCollection("systems", "system_accounts")) { // collection accounts missing 
      this.error("collection_accounts_missing");
      return false; }
    
    return true;
  }
}
mixin(ControllerComponentCalls!("DatabaseHasAccountsCheck"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DDatabaseHasAccountsCheck);
    assert(DatabaseHasAccountsCheck);
    assert(new DDatabaseHasAccountsCheck(Controller));
    assert(DatabaseHasAccountsCheck(Controller));
  }
}