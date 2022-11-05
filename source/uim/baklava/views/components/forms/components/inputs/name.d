module uim.baklava.views.components.forms.components.inputs.name;

@safe:
import uim.baklava;

class DBLVNameFormInput : DBLVTextFormInput {
  mixin(BLVViewComponentThis!("BLVNameFormInput"));

  override void initialize() {
    super.initialize;

    this
      .id("entity_name")
      .inputName("entity_name")
      .fieldName("name")
      .label("Name")
      .placeholder("Name eingeben")
      .invalidFeedback("Name ist nicht korrekt");
  }
}
mixin(BLVViewComponentCalls!("BLVNameFormInput", "DBLVNameFormInput"));
