/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.components.inputs.description;

@safe:
import uim.mvc;

class DDescriptionFormInput : DTextAreaFormInput {
  mixin(ViewComponentThis!("DescriptionFormInput"));

  override void initialize(Json configSettings = Json(null)) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DDescriptionFormInput~"::DDescriptionFormInput("~this.className~"):initialize"); }
    super.initialize(configSettings);
     
    this
      .id("entity_description")
      .inputName("entity_description")
      .fieldName("description")
      .label("Beschreibung")
      .placeholder("Beschreibung eingeben"); 
  }
}
mixin(ViewComponentCalls!("DescriptionFormInput", "DDescriptionFormInput"));

version(test_uim_mvc) { unittest {
  assert(DescriptionFormInput);
}}