module uim.mvc.views.components.forms.crud.elements;

@safe:
import uim.mvc;

class DMVCElementsForm : DForm {
  mixin(MVCViewComponentThis!("MVCElementsForm"));

  mixin(OProperty!("DElement[]", "elements"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCViewComponentCalls!("MVCElementsForm", "DMVCElementsForm"));
