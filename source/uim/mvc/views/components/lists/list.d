/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.lists.list;

import uim.mvc;
@safe:

class DAPPListViewComponent : DEntitiesViewComponent {
  mixin(ViewComponentThis!("APPListViewComponent"));

  mixin(SProperty!("DH5Obj", "noEntities"));
  mixin(SProperty!("DEntity[UUID]", "themesById"));

  mixin(OProperty!("DListItem", "itemTemplate"));
  mixin(OProperty!("DViewComponent", "listContent"));
  mixin(OProperty!("DViewComponent", "header"));
  mixin(OProperty!("DViewComponent", "footer"));

  mixin(OProperty!("string[]", "headerClasses"));
  mixin(OProperty!("string[]", "contentClasses"));
  mixin(OProperty!("string[]", "footerClasses"));


  override DH5Obj[] toH5(STRINGAA options = null) { 
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

    auto card = BS5Card;
    if (showHeader) card.header(["d-block"]~headerClasses, this.header.toH5(options));
    card.body_(contentClasses, this.listContent.toH5(options));
    if (showFooter) card.footer(["d-block"]~footerClasses, this.footer.toH5(options));

    return [card].toH5;
  }
}
mixin(ViewComponentCalls!("APPListViewComponent"));
