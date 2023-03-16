/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.creators.account;

@safe:
import uim.mvc;

/* static this() {
  appErrorCodes[appErrorPrefix+201] = "Could not create account";
}
 */
class DMVCCreatorAccount : DMVCCreator {
  mixin(ControllerThis!("MVCCreatorAccount"));

/*   override DEntity createEntity(STRINGAA parameters) {
    auto entity = createEntities["account"](Json.emptyObject)
      .id(randomUUID)
      .name(parameters.get("account", "account"~to!string(now)));
    entity["peer"] = parameters.get("peer", "");
    if (database) database["systems", "system_accounts"].insertOne(entity);        

    return entity;
  } */

  override Json message(Json json, STRINGAA parameters) {    
    auto result = super.message(json, parameters);

    result["results"]["account"] = createEntity(parameters).toJson;
    return result;
  }
}
mixin(ControllerCalls!("MVCCreatorAccount"));


version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    /// TODO 
  }}

