/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.DEntityBase", "entityBases.collection_by_name;

import uim.mvc;
@safe:

class DDatabaseHasCollectionCheck : DDatabaseExistsCheck {
  mixin(ControllerComponentThis!("DatabaseHasCollectionCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=collection_missing");
  }

  mixin(OProperty!("string", "tenantName"));
  mixin(OProperty!("string", "collectionName"));
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DDatabaseHasCollectionCheck~":DDatabaseHasCollectionCheck::check");
    if (!super.execute(options)) { return false; }
    
    if (!this.DEntityBase", "entityBase.hasTenant(tenantName) || !this.DEntityBase", "entityBase[tenantName].hasCollection(collectionName)) {  
      this.error("collection_("~tenantName~","~collectionName~")_missing");
      return false; }

    return true;
  }
}
mixin(ControllerComponentCalls!("DatabaseHasCollectionCheck"));
