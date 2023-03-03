/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
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

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DDatabaseHasAccountsCheck);
    assert(DatabaseHasAccountsCheck);
    assert(new DDatabaseHasAccountsCheck(Controller));
    assert(DatabaseHasAccountsCheck(Controller));
  }
}