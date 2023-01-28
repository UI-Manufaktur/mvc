module uim.mvc.views.components.forms.crud.element;

@safe:
import uim.mvc;

class DMVCElementForm : DForm {
  mixin(MVCViewComponentThis!("MVCElementForm"));

  mixin(OProperty!("DElement", "element"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCViewComponentCalls!("MVCElementForm", "DMVCElementForm"));
