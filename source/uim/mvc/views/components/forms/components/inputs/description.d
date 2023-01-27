module uim.mvc.views.components.forms.components.inputs.description;

@safe:
import uim.mvc;

class DMVCDescriptionFormInput : DMVCTextAreaFormInput {
  mixin(BKLViewComponentThis!("BKLDescriptionFormInput"));

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
mixin(BKLViewComponentCalls!("BKLDescriptionFormInput", "DMVCDescriptionFormInput"));

version(test_baklava) { unittest {
  assert(BKLDescriptionFormInput);
}}