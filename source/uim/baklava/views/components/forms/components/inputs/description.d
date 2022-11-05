module uim.baklava.views.components.forms.components.inputs.description;

@safe:
import uim.baklava;

class DBLVDescriptionFormInput : DBLVTextAreaFormInput {
  mixin(BLVViewComponentThis!("BLVDescriptionFormInput"));

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
mixin(BLVViewComponentCalls!("BLVDescriptionFormInput", "DBLVDescriptionFormInput"));

version(test_uim_apps) { unittest {
  assert(BLVDescriptionFormInput);
}}