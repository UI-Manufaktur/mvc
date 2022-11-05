module uim.mvc.views.components.forms.crud.elements;

@safe:
import uim.mvc;

class DElementsForm : DForm {
  mixin(MVCViewComponentThis!("ElementsForm"));

  mixin(OProperty!("DOOPElement[]", "elements"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCViewComponentCalls!("ElementsForm"));
