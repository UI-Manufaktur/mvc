module uim.mvc.controllers.creators.site;

@safe:
import uim.mvc;

class DMVCCreatorSite : DMVCCreator {
  mixin(ControllerThis!("MVCCreatorSite"));

/*   override DEntity createEntity(STRINGAA options) {
    auto col = database["systems", "system_sites"];

    return  col.notNull ? col
      .createFromTemplate
      .name(options.get("site", "site"~to!string(now)))  
      .save : null;
  } */

  override Json message(STRINGAA options) {
    auto result = Json.emptyObject;
    return super.message(result, options);
  }

  override Json message(Json json, STRINGAA options) {    
    auto result = super.message(json, options);

    result["results"]["site"] = createEntity(options).toJson;
    return result;
  }
}
mixin(ControllerCalls!("MVCCreatorSite"));
