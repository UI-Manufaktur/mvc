module uim.mvc.views.components.forms.crud.entity;

@safe:
import uim.mvc;

class DMVCEntityForm : DMVCForm {
  mixin(BKLViewComponentThis!("BKLEntityForm"));

  // mixin(OProperty!("DOOPEntity", "entity"));

  override void initialize() {
    super.initialize;
  }
}
mixin(BKLViewComponentCalls!("BKLEntityForm", "DMVCEntityForm"));
