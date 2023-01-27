module uim.baklava.views.components.pages.page;

@safe:
import uim.baklava;

class DBKLPageViewComponent
 : DBKLViewComponent {
  mixin(BKLViewComponentThis!("BKLPageViewComponent"));
  
  override void initialize() {
    this
      .header(BKLPageHeader)
      .body_(BKLPageBody)
      .footer(BKLPageFooter);
  }

  mixin(OProperty!("DBKLPageHeaderViewComponent", "header"));
  mixin(OProperty!("DBKLPageBodyViewComponent", "body_"));
  mixin(OProperty!("DBKLPageFooterViewComponent", "footer"));

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
mixin(BKLViewComponentCalls!("BKLPageViewComponent", "DBKLPageViewComponent"));
