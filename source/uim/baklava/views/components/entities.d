module uim.baklava.views.components.entities;

@safe:
import uim.baklava;

class DBKLEntitiesViewComponent : DBKLViewComponent {
  mixin(BKLViewComponentThis!("BKLEntitiesViewComponent"));

  // mixin(OProperty!("DOOPEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DBKLEntitiesViewComponent~":DBKLEntitiesViewComponent("~this.name~")::beforeH5");
    super.beforeH5(options);
  }
}
mixin(BKLViewComponentCalls!("BKLEntitiesViewComponent", "DBKLEntitiesViewComponent"));
