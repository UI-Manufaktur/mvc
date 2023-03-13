/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.pages.headers.entities.edit;

@safe:
import uim.mvc;

class DMVCEditPageHeaderViewComponent : DPageHeaderViewComponent {
  mixin(ViewComponentThis!("MVCEditPageHeaderViewComponent"));
  
  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .actions([["refresh"], ["list"], ["view"], ["print", "export"]]); 
  }
}
mixin(ViewComponentCalls!("MVCEditPageHeaderViewComponent", "DMVCEditPageHeaderViewComponent"));
mixin(ViewComponentCalls!("MVCEditPageHeader", "DMVCEditPageHeaderViewComponent"));

/*

override DH5Obj[] toH5(STRINGAA options) {
    // debug writeln("DAPPEditPageHeader/toH5");

    auto id = entity ? entity.id.toString : UUID().toString;
    return
      [H5Div(["page-header d-print-none"], 
        BS5Row(["align-items-center"])
        .col(["col"], 
            H5Div("pageBreadcrumbs", [BreadcrumbsStyle], breadcrumbs),
            H5H2(["page-title"], titleEdit("Bearbeiten")))
        .col(["col-auto ms-auto d-print-none"], 
          H5Div(["btn-list"], 
            H5Span(["d-none d-sm-inline g-2"], 
/*                 buttonLinkRefresh(rootPath, id, ["me-3"]),
                buttonLinkList(rootPath, ["me-3"]),
                buttonLinkCreate(rootPath, ["me-1"]),
                buttonLinkView(rootPath, id, ["me-1"]),
                buttonLinkDelete(rootPath, id, [""]) * /
              )                
            )
          )
        )];

  }
*/