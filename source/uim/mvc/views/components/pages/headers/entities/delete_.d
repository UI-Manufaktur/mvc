/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.pages.headers.entities.delete_;

@safe:
import uim.mvc;

class DMVCDeletePageHeaderViewComponent : DPageHeaderViewComponent {
  mixin(ViewComponentThis!("MVCDeletePageHeaderViewComponent"));
  
  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .actions([["refresh"], ["list"], ["view", "edit"], ["print", "export"]]); 
  }
}
mixin(ViewComponentCalls!("MVCDeletePageHeaderViewComponent", "DMVCDeletePageHeaderViewComponent"));
mixin(ViewComponentCalls!("MVCDeletePageHeader", "DMVCDeletePageHeaderViewComponent"));

/*

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;
    this.actions([["list", "create"]]); 
  }
  
  override DH5Obj[] toH5(STRINGAA options) {
    // debug writeln("DAPPDeletePageHeader/toH5");

    auto id = entity ? entity.id.toString : UUID().toString;
    return [
      H5Div(["page-header d-print-none"], 
        BS5Row(["align-items-center"])
        .col(["col"], 
          H5Div("pageBreadcrumbs", [BreadcrumbsStyle], mainTitle),
          H5H2(["page-title"], titleDelete(subTitle)))
        .col(["col-auto ms-auto d-print-none"], 
          H5Div(["btn-list"], 
            H5Span(["d-none d-sm-inline g-2"], 
/*               buttonLinkRefresh(rootPath, id),
              buttonLinkList(rootPath),
              buttonLinkCreate(rootPath),
              buttonLinkView(rootPath, id),
              buttonLinkEdit(rootPath, id) * /
            )                
          )
        )
      )];
  }
}
mixin(ViewComponentCalls!("APPDeletePageHeader", Yes.WithEntity));

*/