module uim.baklava.views.components.forms.crud.entity;

@safe:
import uim.baklava;

class DBKLEntityForm : DBKLForm {
  mixin(BKLViewComponentThis!("BKLEntityForm"));

  // mixin(OProperty!("DOOPEntity", "entity"));

  override void initialize() {
    super.initialize;
  }
}
mixin(BKLViewComponentCalls!("BKLEntityForm", "DBKLEntityForm"));
