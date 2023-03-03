/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.databases.systems.tenant;

@safe:
import uim.mvc;

class DDatabaseHasSystemsCheck : DDatabaseExistsCheck {
  mixin(ControllerComponentThis!("DatabaseHasSystemsCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=tenant_systems_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DDatabaseHasSystemsCheck~":DDatabaseHasSystemsCheck::execute");
    if (!super.execute(options)) { return false; }

    debug writeln(this.database ? "Database exists" : "Database missing");

    if (!this.database.hasTenant("systems")) {  
      this.error("tenant_systems_missing");
      return false; }

    return true;
  }
}
mixin(ControllerComponentCalls!("DatabaseHasSystemsCheck"));
