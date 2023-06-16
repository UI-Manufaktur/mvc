/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.tabpanes.tabpane;

import uim.mvc;
@safe:

class DTabPane : DViewComponent {
  mixin(ViewComponentThis!("TabPane"));

  // this.key("tab"~to!string(uniform(0, 1000))).title("Tab");

  mixin(OProperty!("bool", "disabled"));
  mixin(OProperty!("bool", "active"));
  mixin(OProperty!("string", "title"));
  mixin(OProperty!("string", "key"));
  mixin(OProperty!("string", "path"));

  mixin(OProperty!("string[]", "actions"));

  mixin(OProperty!("DViewComponent", "header"));
  mixin(OProperty!("DViewComponent", "content"));
  mixin(OProperty!("DViewComponent", "footer"));

  override DH5Obj[] toH5(STRINGAA options = null) { 
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

    auto card = BS5Card;
    if (showHeader) card.header(
        this.header.toH5(options));

    card(this.content.toH5(options));

    if (showFooter) card.footer(
        this.footer.toH5(options));

    return [card].toH5;
  }
}
mixin(ViewComponentCalls!("TabPane"));
