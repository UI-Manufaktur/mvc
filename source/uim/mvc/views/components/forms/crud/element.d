module uim.mvc.views.components.forms.crud.element;

@safe:
import uim.mvc;

class DMVCElementForm : DMVCForm {
  mixin(MVCViewComponentThis!("MVCElementForm"));

  mixin(OProperty!("DOOPElement", "element"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCViewComponentCalls!("MVCElementForm", "DMVCElementForm"));
