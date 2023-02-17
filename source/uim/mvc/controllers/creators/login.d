module uim.mvc.controllers.creators.login;

@safe:
import uim.mvc;

class DMVCCreatorLogin : DMVCCreator {
  mixin(ControllerThis!("MVCCreatorLogin"));

/*   override DEntity createEntity(STRINGAA parameters) {
    auto entity = createEntities["login"](Json.emptyObject)
      .id(randomUUID)
      .name(parameters.get("login", "login"~to!string(now)));
    entity["accountName"] = parameters.getValue(["entity_accountName", "accountName"], "");
    if (database) database["systems", "system_logins"].insertOne(entity);        

    return entity;
  } */

  override Json message(Json json, STRINGAA parameters) {    
    auto result = super.message(json, parameters);

    result["results"]["login"] = createEntity(parameters).toJson;
    return result;
  }
}
mixin(ControllerCalls!("MVCCreatorLogin"));

