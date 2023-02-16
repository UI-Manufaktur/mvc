module uim.mvc.controllers.checks.databases.systems.tenant;

@safe:
import uim.mvc;

class DControllerDatabaseHasSystemsCheck : DDatabaseExistsCheck {
  mixin(ControllerComponentThis!("DatabaseHasSystemsCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=tenant_systems_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DControllerDatabaseHasSystemsCheck~":DControllerDatabaseHasSystemsCheck::execute");
    if (!super.execute(options)) { return false; }

    debug writeln(this.database ? "Database exists" : "Database missing");

    if (!this.database.hasTenant("systems")) {  
      this.error("tenant_systems_missing");
      return false; }

    return true;
  }
}
mixin(ControllerComponentCalls!("DatabaseHasSystemsCheck"));
