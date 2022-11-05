module uim.mvc.views.components.forms.components.inputs.description;

@safe:
import uim.mvc;

class DMVCDescriptionFormInput : DMVCTextAreaFormInput {
  mixin(MVCViewComponentThis!("MVCDescriptionFormInput"));

  override void initialize() {
    super.initialize;
     
    this
      .id("entity_description")
      .inputName("entity_description")
      .fieldName("description")
      .label("Beschreibung")
      .placeholder("Beschreibung eingeben"); 
  }
}
mixin(MVCViewComponentCalls!("MVCDescriptionFormInput", "DMVCDescriptionFormInput"));

version(test_uim_apps) { unittest {
  assert(MVCDescriptionFormInput);
}}