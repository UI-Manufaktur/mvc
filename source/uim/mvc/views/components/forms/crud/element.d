module uim.mvc.views.components.forms.crud.element;

@safe:
import uim.mvc;

class DMVCElementForm : DMVCForm {
  mixin(MVCViewComponentThis!("MVCElementForm"));

  mixin(OProperty!("DElement", "element"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCViewComponentCalls!("MVCElementForm", "DMVCElementForm"));
