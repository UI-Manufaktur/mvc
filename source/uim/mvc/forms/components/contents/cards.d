/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.components.contents.cards;

import uim.mvc;

@safe:
class DMVCCardsFormContent : DMVCEntitiesViewComponent {
  mixin(ViewComponentThis!("MVCCardsFormContent"));

  mixin(OProperty!("DMVCEntityViewComponent", "card"));

  override bool initialize(IData[string] configSettings = null) {
    debugMethodCall(moduleName!DMVCCardsFormContent~"::DMVCCardsFormContent("~this.name~"):initialize");   
    super.initialize(configSettings);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntitiesFormContent~"DEntitiesFormContent::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    debug writeln("Found entities for table = ", entities.length);

    DH5Obj[] cards = entities.map!(entity => entity ? card.entity(entity).toH5 : null).join; 
      
    return [
      BS5Row(["row-cards"], cards)
    ].toH5;
  } 
}
mixin(ViewComponentCalls!("MVCCardsFormContent", "DMVCCardsFormContent"));

version(test_uim_mvc) { unittest {
  assert(MVCCardsFormContent);
}}