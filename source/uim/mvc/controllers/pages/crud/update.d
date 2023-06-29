/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.crud.update;
/**************************************************/
/* This package contains general edit page definitions */
/**************************************************/

import uim.mvc;

@safe:
class DEntityUpdateController : DEntityCrudPageController {
  mixin(ControllerThis!("EntityUpdateController"));
  
override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
  
    this
      .view(EntityUpdateView)
      .scripts
        .addLinks(         
          "/js/apps/entities/entity.js", 
          "/js/apps/entities/edit.js", // deprecated
          "/js/apps/entities/update.js");
  }

/*   this(string newEntityName) {
    this()
    .entityName(newEntityName)
    .scripts.addLinks(
      "/js/apps/entities/"~entityName~"/entity.js", 
      "/js/apps/entities/"~entityName~"/edit.js", // deprecated
      "/js/apps/entities/"~entityName~"/update.js");
  } */

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DEntityUpdateController~":DEntityUpdateController::beforeResponse");
    if (!super.beforeResponse(options) || "redirect" in options) return false;

    auto session = manager.session(options);

    if (!manager) {
      this.error("manager_missing");
      return false; 
    }

    auto myEntityBase = manager.entityBase;
    if (!myEntityBase) {
      this.error("entitybase_missing");
      return false; 
    }

    this.entity(myEntityBase[session.site, collectionName].findOne(options.toEntitySelect));
    if (!entity) {
      // TODO Errorhandling
      return false;
    }

    auto poolId = uniform(1, 1_000_000_000);
    entityPool[poolId] = entity;
    options["entityPool"] = to!string(poolId);
  
    if (auto myView = cast(DEntityView)this.view) {
      myView.entity(this.entity);
    }

    if (viewMode == ViewModes.JS) {
      options["script"] = options.get("script", "")~
`window.addEventListener('load', (event) => {
  document.getElementById("Form").addEventListener("submit", event => {
    event.preventDefault();
    editEntity();
  })
});`;
    }

    return true;
  }
}  
mixin(ControllerCalls!("EntityUpdateController"));

/* class DAPPUpdatePage : DAPPPage {
    this() { super(); 
      this
      .title("ADMIN!CMS - Themes - Edit")
        ["src":"/js/apps/cms/app.js"],
      ["src":"/js/apps/"~myJsPath~"/entity.js"],
        ["src":"/js/apps/"~myJsPath~"/edit.js"])    
      .scripts(
        `let editor_text; let editor_summary;`);
    }

/*    override DH5Obj[] toH5(STRINGAA requestParameters) { 
      // debug writeln(StyledString("In "~_request.path~"-DAPPUpdatePage:toJson...").setForeground(AnsiColor.green).setBackground(AnsiColor.white));

      auto json = this.app.DEntityBase", "entityBase.findOne("siteName", "myPool", urlToSelect(requestParameters));
      auto entity = OOPEntity;

      auto tabpanes = APPPanes(entity);
      tabpanes.panes([
          APPPaneGeneral(entity),
          APPPaneVersions(entity),
          APPPaneHistory(entity)
      ]); */

/*       .panes(
        ACGeneralPane("general", "General", "/themes"),
        ACTabpane("specific", "Specific", myPath),
        ACAttclassesPane("attclasses", "Attribute Classes", myPath).attclasses(entity.attclasses).actions(["view", "remove"]),
        ACObjclassesPane("objclasses", "Object Classes", myPath).objclasses(entity.objclasses).actions(["view", "remove"]),
        ACVersionsPane("versions", "Versions", myPath)
          .versions(this.app.DEntityBase", "entityBase.find("themes", ["id":requestParameters["id"]])),
        ACHistoryPane("history", "History", myPath)
      );
 *
 /      if ("pane" in requestParameters) tabpanes.active(requestParameters["pane"]); else tabpanes.panes[0].active = true;

      return 
        H5Div(["content"],
          H5Div(["container-xl"], 
            BS5Row("messages", [""]),
            BS5Row(["row-cards"],
                //CMSThemeForm("update", myPath).panes(tabpanes).entity(entity).toH5(requestParameters)

//                editTheme("/themes", entity, tabpanes, requestParameters)
            )
          )
        );

    }
  }*/ 