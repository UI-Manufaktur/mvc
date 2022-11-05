module uim.mvc.views.components.forms.components.inputs.display;

@safe:
import uim.mvc;

class DDisplayFormInput : DMVCTextFormInput {
  mixin(MVCViewComponentThis!("MVCDisplayFormInput", true));

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
mixin(MVCViewComponentCalls!("MVCDisplayFormInput", "DMVCDisplayFormInput"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    // TODO Add Tests
}}