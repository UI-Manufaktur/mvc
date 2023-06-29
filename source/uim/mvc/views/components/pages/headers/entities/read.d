/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.pages.headers.entities.read;

import uim.mvc;

@safe:
class DMVCReadPageHeaderViewComponent : DPageHeaderViewComponent {
  mixin(ViewComponentThis!("MVCReadPageHeaderViewComponent"));
  
  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
  }
}
mixin(ViewComponentCalls!("MVCReadPageHeaderViewComponent", "DMVCReadPageHeaderViewComponent"));
mixin(ViewComponentCalls!("MVCReadPageHeader", "DMVCReadPageHeaderViewComponent"));

/*

override DH5Obj[] toH5(STRINGAA options) {
    // debug writeln(StyledString("DViewPageHeader/toH5").setForeground(AnsiColor.green).setBackground(AnsiColor.lightBlue));

    auto id = entity ? entity.id.toString : UUID().toString;
    return
      [H5Div(["page-header d-print-none"], 
        BS5Row(["row align-items-center"])
        .col(["col"], 
          H5Div("pageBreadcrumbs", [BreadcrumbsStyle], breadcrumbs),
          H5H2(["page-title"], titleView(title)))
        .col(["col-auto ms-auto d-print-none"], 
          H5Div(["btn-list"], 
            H5Span(["d-none d-sm-inline g-2"], 
/*               buttonLinkRefresh(rootPath, id),
              buttonLinkList(rootPath),
              buttonLinkCreate(rootPath, ["me-1"]),
              buttonLinkEdit(rootPath, id, ["me-1"]),
              buttonLinkDelete(rootPath, id) * /
            )
          )
        )
      )];
  }

*/