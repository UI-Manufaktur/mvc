module uim.mvc.views.components.forms.components.inputs.display;

@safe:
import uim.mvc;

class DMVCDisplayFormInput : DMVCTextFormInput {
  mixin(BKLViewComponentThis!("BKLDisplayFormInput"));

  override void initialize() {
    super.initialize();

    this
    .id("entity_display")
    .inputName("entity_display")
    .fieldName("display")
    .label("Titel")
    .placeholder("Titel eingeben")
    .invalidFeedback("Titel ist nicht korrekt"); 
  }
}
mixin(BKLViewComponentCalls!("BKLDisplayFormInput", "DMVCDisplayFormInput"));

version(test_baklava) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    // TODO Add Tests
}}