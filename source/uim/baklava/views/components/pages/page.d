module uim.baklava.views.components.pages.page;

@safe:
import uim.baklava;

class DMVCPageViewComponent
 : DMVCViewComponent {
  mixin(MVCViewComponentThis!("MVCPageViewComponent"));
  
  override void initialize() {
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
mixin(MVCViewComponentCalls!("MVCPageViewComponent", "DMVCPageViewComponent"));
