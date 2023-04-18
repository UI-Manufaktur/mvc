/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.components.inputs.display;

@safe:
import uim.mvc;

class DDisplayFormInput : DTextFormInput {
  mixin(ViewComponentThis!("DisplayFormInput"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .id("entity_display")
    .inputName("entity_display")
    .fieldName("display")
    .label("Titel")
    .placeholder("Titel eingeben")
    .invalidFeedback("Titel ist nicht korrekt"); 
  }
}
mixin(ViewComponentCalls!("DisplayFormInput", "DDisplayFormInput"));

///
unittest {
  auto forminput = new DDisplayFormInput;

  assert(forminput.id == "entity_display");
  assert(forminput.inputName == "entity_display");
  assert(forminput.fieldName == "display");
  assert(forminput.label == "Titel");
  assert(forminput.placeholder == "Titel eingeben");
  assert(forminput.invalidFeedback == "Titel ist nicht korrekt"); 
}