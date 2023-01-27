module uim.mvc.views.components.forms.crud.elements;

@safe:
import uim.mvc;

class DMVCElementsForm : DMVCForm {
  mixin(BKLViewComponentThis!("BKLElementsForm"));

  mixin(OProperty!("DOOPElement[]", "elements"));

  override void initialize() {
    super.initialize;
  }
}
mixin(BKLViewComponentCalls!("BKLElementsForm", "DMVCElementsForm"));
