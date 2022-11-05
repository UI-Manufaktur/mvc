module uim.baklava.views.components.forms.components.contents.cards;

@safe:
import uim.baklava;

class DBLVCardsFormContent : DBLVEntitiesViewComponent {
  mixin(BLVViewComponentThis!("BLVCardsFormContent"));

  mixin(OProperty!("DBLVEntityViewComponent", "card"));

  override void initialize() {
    debugMethodCall(moduleName!DBLVCardsFormContent~"::DBLVCardsFormContent("~this.name~"):initialize");   
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DBLVEntitiesFormContent~"DBLVEntitiesFormContent::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    debug writeln("Found entities for table = ", entities.length);

    DH5Obj[] cards = entities.map!(entity => entity ? card.entity(entity).toH5 : null).join; 
      
    return [
      BS5Row(["row-cards"], cards)
    ].toH5;
  } 
}
mixin(BLVViewComponentCalls!("BLVCardsFormContent", "DBLVCardsFormContent"));

version(test_uim_apps) { unittest {
  assert(BLVCardsFormContent);
}}