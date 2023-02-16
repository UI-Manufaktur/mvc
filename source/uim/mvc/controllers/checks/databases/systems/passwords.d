module uim.mvc.controllers.checks.databases.systems.passwords;

@safe:
import uim.mvc;

class DDatabaseHasPasswordsCheck : DDatabaseHasSystemsCheck {
  mixin(ControllerComponentThis!("DatabaseHasPasswordsCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=collection_passwords_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DDatabaseHasPasswordsCheck~":DDatabaseHasPasswordsCheck::check");
    if (!super.execute(options)) { return false; }

    if (!this.database.hasCollection("systems", "system_passwords")) { // collection passwords missing 
      this.error("collection_passwords_missing");
      return false; 
    }
    
    return true;
  }
}
mixin(ControllerComponentCalls!("DatabaseHasPasswordsCheck"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DDatabaseHasPasswordsCheck);
    assert(DatabaseHasPasswordsCheck);
    assert(new DDatabaseHasPasswordsCheck(Controller));
    assert(DatabaseHasPasswordsCheck(Controller));
  }
}