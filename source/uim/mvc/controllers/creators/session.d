module uim.mvc.controllers.creators.session;

@safe:
import uim.mvc;

class DMVCCreatorSession : DMVCCreator {
  mixin(ControllerThis!("MVCCreatorSession"));

/*   override DEntity createEntity(STRINGAA options) {
    auto entity = createEntities["session"](Json.emptyObject)
      .id(randomUUID)
      .name(options.get("session", "session"~to!string(now)));
    if (database) database["systems", "system_sessions"].insertOne(entity);        

    return entity;
  } */

  override Json message(Json json, STRINGAA options) {    
    auto result = super.message(json, options);

    if (auto session = createEntity(options)) {
      result["results"]["session"] = session.toJson;
    }
    else { // not validation error
      auto error = Json.emptyObject;
      error["id"] = "007";
      error["message"] = "Could not create session";
      result["errors"] ~= error;
    }
    return result; }
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}
  }
mixin(ControllerCalls!("MVCCreatorSession"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    /// TODO 
  }}

