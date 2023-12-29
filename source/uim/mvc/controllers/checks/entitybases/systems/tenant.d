/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.entitybases.systems.entityTenant;

import uim.mvc;

@safe:
class DDatabaseHasSystemsCheck : DDatabaseExistsCheck {
  mixin(ControllerComponentThis!("DatabaseHasSystemsCheck"));

  override void initialize(Json[string] configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=tenant_systems_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DDatabaseHasSystemsCheck~":DDatabaseHasSystemsCheck::execute");
    if (!super.execute(options)) { 
      return false; 
    }

    if (!manager) {
      this.error("manager_missing");
      return false; 
    }

    auto myEntityBase = manager.entityBase;
    if (!myEntityBase) {
      this.error("entitybase_missing");
      return false; 
    }

    if (!myEntityBase.hasEntityTenant("systems")) {  
      this.error("tenant_systems_missing");
      return false; }

    return true;
  }
}
mixin(ControllerComponentCalls!("DatabaseHasSystemsCheck"));
