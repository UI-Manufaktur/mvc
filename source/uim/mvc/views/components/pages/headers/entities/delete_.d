module uim.mvc.views.components.pages.headers.entities.delete_;

@safe:
import uim.mvc;

class DMVCDeletePageHeader : DPageHeader {
  mixin(MVCViewComponentThis!("MVCDeletePageHeader", Yes.WithEntity));
  
  override void initialize() {
    super.initialize;
    this.actions([["list", "create"]]); 
  }
  
  override DH5Obj[] toH5(STRINGAA options) {
    // debug writeln("DMVCDeletePageHeader/toH5");

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
              buttonLinkRefresh(rootPath, id),
              buttonLinkList(rootPath),
              buttonLinkCreate(rootPath),
              buttonLinkView(rootPath, id),
              buttonLinkEdit(rootPath, id)
            )                
          )
        )
      )];
  }
}
mixin(MVCViewComponentCalls!("MVCDeletePageHeader", Yes.WithEntity));
