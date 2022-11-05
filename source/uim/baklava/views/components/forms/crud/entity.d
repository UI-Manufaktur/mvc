module uim.baklava.views.components.forms.crud.entity;

@safe:
import uim.baklava;

class DBLVEntityForm : DBLVForm {
  mixin(BLVViewComponentThis!("BLVEntityForm"));

  // mixin(OProperty!("DOOPEntity", "entity"));

  override void initialize() {
    super.initialize;
  }
}
mixin(BLVViewComponentCalls!("BLVEntityForm", "DBLVEntityForm"));
