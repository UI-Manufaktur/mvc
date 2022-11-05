module uim.baklava.views.components.entities;

@safe:
import uim.baklava;

class DBLVEntitiesViewComponent : DBLVViewComponent {
  mixin(BLVViewComponentThis!("BLVEntitiesViewComponent"));

  // mixin(OProperty!("DOOPEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DBLVEntitiesViewComponent~":DBLVEntitiesViewComponent("~this.name~")::beforeH5");
    super.beforeH5(options);
  }
}
mixin(BLVViewComponentCalls!("BLVEntitiesViewComponent", "DBLVEntitiesViewComponent"));
