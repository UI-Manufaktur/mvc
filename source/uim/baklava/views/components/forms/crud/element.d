module uim.baklava.views.components.forms.crud.element;

@safe:
import uim.baklava;

class DBKLElementForm : DBKLForm {
  mixin(BKLViewComponentThis!("BKLElementForm"));

  mixin(OProperty!("DOOPElement", "element"));

  override void initialize() {
    super.initialize;
  }
}
mixin(BKLViewComponentCalls!("BKLElementForm", "DBKLElementForm"));
