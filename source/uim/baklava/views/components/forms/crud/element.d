module uim.baklava.views.components.forms.crud.element;

@safe:
import uim.baklava;

class DBLVElementForm : DBLVForm {
  mixin(BLVViewComponentThis!("BLVElementForm"));

  mixin(OProperty!("DOOPElement", "element"));

  override void initialize() {
    super.initialize;
  }
}
mixin(BLVViewComponentCalls!("BLVElementForm", "DBLVElementForm"));
