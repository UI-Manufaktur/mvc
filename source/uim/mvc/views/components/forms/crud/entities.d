module uim.baklava.views.components.forms.crud.entities;

@safe:
import uim.baklava;

class DBKLEntitiesForm : DBKLForm {
  mixin(BKLViewComponentThis!("BKLEntitiesForm"));

  // mixin(OProperty!("DOOPEntity[]", "entities"));

  override void initialize() {
    super.initialize;
  }
}
mixin(BKLViewComponentCalls!("BKLEntitiesForm", "DBKLEntitiesForm"));
