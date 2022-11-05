module uim.baklava.views.components.forms.components.inputs.description;

@safe:
import uim.baklava;

class DBKLDescriptionFormInput : DBKLTextAreaFormInput {
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
mixin(BKLViewComponentCalls!("BKLDescriptionFormInput", "DBKLDescriptionFormInput"));

version(test_baklava) { unittest {
  assert(BKLDescriptionFormInput);
}}