module uim.mvc.views.components.forms.crud.elements;

@safe:
import uim.mvc;

class DBKLElementsForm : DBKLForm {
  mixin(BKLViewComponentThis!("BKLElementsForm"));

  mixin(OProperty!("DOOPElement[]", "elements"));

  override void initialize() {
    super.initialize;
  }
}
mixin(BKLViewComponentCalls!("BKLElementsForm", "DBKLElementsForm"));
