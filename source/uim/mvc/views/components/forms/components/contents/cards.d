/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.components.contents.cards;

@safe:
import uim.mvc;

class DMVCCardsFormContent : DMVCEntitiesViewComponent {
  mixin(MVCViewComponentThis!("MVCCardsFormContent"));

  mixin(OProperty!("DMVCEntityViewComponent", "card"));

  override void initialize() {
    debugMethodCall(moduleName!DMVCCardsFormContent~"::DMVCCardsFormContent("~this.name~"):initialize");   
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCEntitiesFormContent~"DMVCEntitiesFormContent::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    debug writeln("Found entities for table = ", entities.length);

    DH5Obj[] cards = entities.map!(entity => entity ? card.entity(entity).toH5 : null).join; 
      
    return [
      BS5Row(["row-cards"], cards)
    ].toH5;
  } 
}
mixin(MVCViewComponentCalls!("MVCCardsFormContent", "DMVCCardsFormContent"));

version(test_uim_mvc) { unittest {
  assert(MVCCardsFormContent);
}}