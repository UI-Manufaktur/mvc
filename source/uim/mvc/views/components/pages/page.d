/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.pages.page;

@safe:
import uim.mvc;

class DPageViewComponent : DViewComponent {
  mixin(ViewComponentThis!("PageViewComponent"));
  
  override void initialize(Json configSettings = Json(null)) {
    this
      .header(PageHeader)
      .body_(MVCPageBody)
      .footer(MVCPageFooter);
  }

  mixin(OProperty!("DPageHeaderViewComponent", "header"));
  mixin(OProperty!("DPageBodyViewComponent", "body_"));
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
mixin(ViewComponentCalls!("PageViewComponent", "DPageViewComponent"));
