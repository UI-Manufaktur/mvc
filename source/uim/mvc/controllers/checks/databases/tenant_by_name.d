/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.databases.tenant_by_name;

@safe:
import uim.mvc;

class DDatabaseHasTenantCheck : DDatabaseExistsCheck {
  mixin(ControllerComponentThis!("DatabaseHasTenantCheck"));

  override void initialize(Json configSettings = Json(null)) {
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
