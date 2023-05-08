/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.tables.versions;

import uim.mvc;
@safe:

/* class DTableVersions : DMVCEntitiesTableHeader {
  mixin(ViewComponentThis!("MVCTableVersions"));

  mixin(OProperty!("DEntity[]", "versions"));
  O versions(this O)(Json[] jsons) {
      foreach(json; jsons) _versions ~= DEntity(json);
      return cast(O)this; }

  mixin(OProperty!("string[]", "actions"));

  DH5Obj row(DEntity entity, string[] rowActions = ["view", "delete"]) {
      auto link = "?entity_id="~entity.id.toString~"&number="~to!string(entity.versionNumber);

      auto buttons = H5Span(["d-none d-sm-inline"]);
      foreach(action; rowActions) {
         switch(action) {
          case "view":
            buttons(BS5ButtonLink(["text-white me-1"], ["style":"background-color:#35A6FF", "href":this.path~"/view"~link], 
                  tablerIcon("eye", ["text-white"]))); break;
          case "delete":
            buttons(BS5ButtonLink(["text-white"], ["style":"background-color:#35A6FF", "href":this.path~"/delete"~link], 
              tablerIcon("trash", ["text-white"]))); break;
              default: break;
        } 
      }

      return
        H5Tr
          .td(BS5InputDate(["form-control-flush"], ["readonly":"readonly"]).value(entity.versionOn))
          .td(BS5InputNumber(["form-control-flush"], ["readonly":"readonly"]).value(entity.versionNumber))
          .td(UIMTextInput(["form-control-flush"], ["readonly":"readonly"]).value(entity.versionDescription))
          .td(H5Div(["btn-list"], buttons));
  }

  override void beforeH5(STRINGAA options = null) {   
    super.beforeH5(options);
     
    auto rows = versions.map!(a => row(a)).array;

    _header =  H5Thead(
      H5Tr
        .th(["w-1"], "Version on")
        .th(["w-1"], "Major")
        .th(["w-1"], "Minor")
        .th("Beschreibung")
        .th(["text-end w-1"], "Actions")
      );

    _body = H5Tbody(rows);
  }
}
mixin(ViewComponentCalls!("MVCTableVersions"));
   */