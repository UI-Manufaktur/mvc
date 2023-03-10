/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.components.inputs.description;

@safe:
import uim.mvc;

class DMVCDescriptionFormInput : DMVCTextAreaFormInput {
  mixin(ViewComponentThis!("MVCDescriptionFormInput"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
     
    this
      .id("entity_description")
      .inputName("entity_description")
      .fieldName("description")
      .label("Beschreibung")
      .placeholder("Beschreibung eingeben"); 
  }
}
mixin(ViewComponentCalls!("MVCDescriptionFormInput", "DMVCDescriptionFormInput"));

version(test_uim_mvc) { unittest {
  assert(MVCDescriptionFormInput);
}}