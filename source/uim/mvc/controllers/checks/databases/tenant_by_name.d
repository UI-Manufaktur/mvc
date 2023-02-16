module uim.mvc.controllers.checks.databases.tenant_by_name;

@safe:
import uim.mvc;

class DDatabaseHasTenantCheck : DDatabaseExistsCheck {
  mixin(ControllerComponentThis!("DatabaseHasTenantCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=tenant_missing");
  }

  mixin(OProperty!("string", "tenantName"));
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DDatabaseHasTenantCheck~":DDatabaseHasTenantCheck::check");
    if (!super.execute(options)) { return false; }

    if (!this.database.hasTenant(tenantName)) {  
      this.error("collection_("~tenantName~")_missing");
      return false; }

    return true;
  }
}
mixin(ControllerComponentCalls!("DatabaseHasTenantCheck"));
