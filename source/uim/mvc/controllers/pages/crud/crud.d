module uim.mvc.controllers.pages.crud.crud;

@safe:
import uim.mvc;

class DAPPEntityCrudPageController : DAPPEntityPageController {
  mixin(ControllerThis!("APPEntityCrudPageController"));

  override void beforeResponse(STRINGAA requestParameters) {
    debug writeln(moduleName!DAPPEntityCrudPageController~":DAPPEntityCrudPageController::beforeResponse");
    super.beforeResponse(requestParameters);   
    if ("redirect" in requestParameters) return;
    
    auto myAppSession = getAppSession(requestParameters);

    auto collection = database[myAppSession.site, collectionName]; 
    if (!collection) {
      requestParameters["redirect"] = "/";
      return; }

    this.entity(collection.toEntity(Json(null)));
    if (auto myView = cast(DEntityView)this.view) {
      myView.entity(this.entity);
      
      auto poolId = uniform(1, 1_000_000_000);
      entityPool[poolId] = entity;
      requestParameters["entityPool"] = to!string(poolId);
    }
  }
}
mixin(ControllerCalls!("APPEntityCrudPageController"));
