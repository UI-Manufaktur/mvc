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


version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    /// TODO 
  }}

