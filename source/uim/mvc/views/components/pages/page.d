module uim.mvc.views.components.pages.page;

@safe:
import uim.mvc;

class DMVCPageViewComponent
 : DViewComponent {
  mixin(ViewComponentThis!("MVCPageViewComponent"));
  
  override void initialize(DConfig configSettings = null) {
    this
      .header(MVCPageHeader)
      .body_(MVCPageBody)
      .footer(MVCPageFooter);
  }

  mixin(OProperty!("DMVCPageHeaderViewComponent", "header"));
  mixin(OProperty!("DMVCPageBodyViewComponent", "body_"));
  mixin(OProperty!("DMVCPageFooterViewComponent", "footer"));

  override void _afterSetEntity() {
    if (header) header.entity = this.entity;
    if (body_)  body_.entity = this.entity;
    if (footer) footer.entity = this.entity;
  }

  override void _afterSetEntities() {
    if (header)  header.entities = this.entities;
    if (body_) body_.entities = this.entities;
    if (footer)  footer.entities = this.entities;
  }
}
mixin(ViewComponentCalls!("MVCPageViewComponent", "DMVCPageViewComponent"));
