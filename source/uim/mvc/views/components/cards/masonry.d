/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.cards.masonry;

@safe:
import uim.mvc;

class DAPPMasonaryCardsComponent : DViewComponent {
  mixin(ViewComponentThis!("APPMasonaryCardsComponent"));

  mixin(OProperty!("DH5Obj[]", "cards"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPMasonaryCardsComponent~":DAPPMasonaryCardsComponent("~this.name~")::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

    debug writeln ("Masonary:", 
      BS5Row(["row-cards"], ["data-masonry":"{&quot;percentPosition&quot;: true }"], this.cards));
    return [
      BS5Row(["row-cards"], ["data-masonry":"{&quot;percentPosition&quot;: true }"], this.cards)].toH5;
  }
}
mixin(ViewComponentCalls!("APPMasonaryCardsComponent"));
