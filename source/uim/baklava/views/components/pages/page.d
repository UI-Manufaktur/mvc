module uim.baklava.views.components.pages.page;

@safe:
import uim.baklava;

class DBLVPageViewComponent
 : DBLVViewComponent {
  mixin(BLVViewComponentThis!("BLVPageViewComponent"));
  
  override void initialize() {
    this
      .header(BLVPageHeader)
      .body_(BLVPageBody)
      .footer(BLVPageFooter);
  }

  mixin(OProperty!("DBLVPageHeaderViewComponent", "header"));
  mixin(OProperty!("DBLVPageBodyViewComponent", "body_"));
  mixin(OProperty!("DBLVPageFooterViewComponent", "footer"));

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
mixin(BLVViewComponentCalls!("BLVPageViewComponent", "DBLVPageViewComponent"));
