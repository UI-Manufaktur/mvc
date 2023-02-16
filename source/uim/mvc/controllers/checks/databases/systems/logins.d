module uim.mvc.controllers.checks.databases.systems.logins;

@safe:
import uim.mvc;

class DDatabaseHasLoginsCheck : DControllerCheckDatabaseHasSystems {
  mixin(ControllerComponentThis!("DatabaseHasLoginsCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=collection_logins_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DDatabaseHasLoginsCheck~":DDatabaseHasLoginsCheck::check");
    if (!super.execute(options)) { return false; }

    if (!this.database.hasCollection("systems", "system_logins")) { // collection logins missing 
      this.error("collection_logins_missing");
      return false; }
    
    return true;
  }
}
mixin(ControllerComponentCalls!("DatabaseHasLoginsCheck"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DDatabaseHasLoginsCheck);
    assert(DatabaseHasLoginsCheck);
    assert(new DDatabaseHasLoginsCheck(Controller));
    assert(DatabaseHasLoginsCheck(Controller));
  }
}