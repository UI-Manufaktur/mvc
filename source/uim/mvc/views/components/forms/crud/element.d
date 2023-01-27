module uim.mvc.views.components.forms.crud.element;

@safe:
import uim.mvc;

class DMVCElementForm : DMVCForm {
  mixin(BKLViewComponentThis!("BKLElementForm"));

  mixin(OProperty!("DOOPElement", "element"));

  override void initialize() {
    super.initialize;
  }
}
mixin(BKLViewComponentCalls!("BKLElementForm", "DMVCElementForm"));
