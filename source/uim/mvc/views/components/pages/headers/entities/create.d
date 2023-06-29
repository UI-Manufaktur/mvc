/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.pages.headers.entities.create;

import uim.mvc;

@safe:
class DMVCCreatePageHeaderViewComponent : DPageHeaderViewComponent {
  mixin(ViewComponentThis!("MVCCreatePageHeaderViewComponent"));
  
  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
    
    this
      .actions([["refresh"], ["list"]]); 

    //   .actions([["list", "create"]]); 

  }

  /* override DH5Obj[] toH5(STRINGAA options = null) {
    // debug writeln("DAPPCreatePageHeader/toH5");
    DH5Obj[] buttons = actionButtons(options);

/*     string bcrumbs;
    foreach (index, data; breadcrumbs) { 
      if (index < data.length-1) bcrumbs ~= `<li class="breadcrumb-item"><a href="%s">%s</a></li>`.format(data["url"], data["title"]);
      else bcrumbs ~= `<li class="breadcrumb-item active" aria-current="page"><a href="#">%s</a></li>`.format(data["title"]);
    }
 * /
    auto id = entity ? entity.id.toString : UUID().toString;
    return
      [H5Div(id, ["page-header d-print-none"], 
        BS5Row(["align-items-center"])
          .col(["col"], 
            H5Div("pageBreadcrumbs", [BreadcrumbsStyle], H5Ol(["breadcrumb"], ["aria-label":"breadcrumbs"], breadcrumbs)),
            H5H2(["page-title"], titleList(title)))
          .col(["col-auto ms-auto d-print-none"], 
            H5Div(["btn-list"], buttons) // H5Span(["d-none d-sm-inline"]
          )
        )].toH5;
  } */ 
}
mixin(ViewComponentCalls!("MVCCreatePageHeaderViewComponent", "DMVCCreatePageHeaderViewComponent"));
mixin(ViewComponentCalls!("MVCCreatePageHeader", "DMVCCreatePageHeaderViewComponent"));
