/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.databases.systems.sites;

@safe:
import uim.mvc;

class DDatabaseHasSitesCheck : DDatabaseHasSystemsCheck {
  mixin(ControllerComponentThis!("DatabaseHasSitesCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=collection_sites_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DDatabaseHasSitesCheck~":DDatabaseHasSitesCheck::check");
    if (!super.execute(options)) { return false; }

    if (!this.database.hasCollection("systems", "system_sites")) { // collection sites missing 
      this.error("collection_sites_missing");
      return false; }
    
    return true;
  }
}
mixin(ControllerComponentCalls!("DatabaseHasSitesCheck"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DDatabaseHasSitesCheck);
    assert(DatabaseHasSitesCheck);
    assert(new DDatabaseHasSitesCheck(Controller));
    assert(DatabaseHasSitesCheck(Controller));
  }
}