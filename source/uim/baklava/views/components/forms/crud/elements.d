module uim.baklava.views.components.forms.crud.elements;

@safe:
import uim.baklava;

class DBLVElementsForm : DBLVForm {
  mixin(BLVViewComponentThis!("BLVElementsForm"));

  mixin(OProperty!("DOOPElement[]", "elements"));

  override void initialize() {
    super.initialize;
  }
}
mixin(BLVViewComponentCalls!("BLVElementsForm", "DBLVElementsForm"));
