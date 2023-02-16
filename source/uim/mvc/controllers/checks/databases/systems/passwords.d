module uim.mvc.controllers.checks.databases.systems.passwords;

@safe:
import uim.mvc;

class DControllerDatabaseHasPasswordsCheck : DControllerCheckDatabaseHasSystems {
  mixin(ControllerComponentThis!("APPDatabaseHasPasswordsCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=collection_passwords_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DControllerDatabaseHasPasswordsCheck~":DControllerDatabaseHasPasswordsCheck::check");
    if (!super.execute(options)) { return false; }

    if (!this.database.hasCollection("systems", "system_passwords")) { // collection passwords missing 
      this.error("collection_passwords_missing");
      return false; 
    }
    
    return true;
  }
}
mixin(ControllerComponentCalls!("APPDatabaseHasPasswordsCheck"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DControllerDatabaseHasPasswordsCheck);
    assert(APPDatabaseHasPasswordsCheck);
    assert(new DControllerDatabaseHasPasswordsCheck(Controller));
    assert(APPDatabaseHasPasswordsCheck(Controller));
  }
}