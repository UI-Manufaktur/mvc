/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.components.inputs.name;

@safe:
import uim.mvc;

class DMVCNameFormInput : DMVCTextFormInput {
  mixin(MVCViewComponentThis!("MVCNameFormInput"));

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
mixin(MVCViewComponentCalls!("MVCNameFormInput", "DMVCNameFormInput"));
