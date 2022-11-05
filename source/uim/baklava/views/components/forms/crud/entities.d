module uim.baklava.views.components.forms.crud.entities;

@safe:
import uim.baklava;

class DBLVEntitiesForm : DBLVForm {
  mixin(BLVViewComponentThis!("BLVEntitiesForm"));

  // mixin(OProperty!("DOOPEntity[]", "entities"));

  override void initialize() {
    super.initialize;
  }
}
mixin(BLVViewComponentCalls!("BLVEntitiesForm", "DBLVEntitiesForm"));
