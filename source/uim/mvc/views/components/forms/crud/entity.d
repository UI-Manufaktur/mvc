module uim.mvc.views.components.forms.crud.entity;

@safe:
import uim.mvc;

class DBKLEntityForm : DBKLForm {
  mixin(BKLViewComponentThis!("BKLEntityForm"));

  // mixin(OProperty!("DOOPEntity", "entity"));

  override void initialize() {
    super.initialize;
  }
}
mixin(BKLViewComponentCalls!("BKLEntityForm", "DBKLEntityForm"));
