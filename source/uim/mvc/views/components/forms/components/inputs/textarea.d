/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.components.inputs.textarea;

@safe:
import uim.mvc;

class DMVCTextAreaFormInput : DFormInput {
  mixin(ViewComponentThis!("MVCTextAreaFormInput"));

  override void initialize(DConfig configSettings = null) {
    super.initialize(configSettings);

    this
      .rows("3")
      .autocomplete("off"); 
  }

  mixin(OProperty!("string", "rows"));
  mixin(OProperty!("string", "autocomplete"));

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    auto input = BS5InputTextarea(id, ["rows":rows, "name":inputName, "autocomplete":autocomplete, "placeholder":placeholder], entity ? entity[fieldName] : "");
    if (readonly) input.attribute("readonly","readonly");
    if (crudMode == CRUDModes.Read || crudMode == CRUDModes.Delete) input.attribute("readonly","readonly");

    return [
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], label),
        BS5Col(["col"], input))].toH5;
  }
version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
      // 
      }}
}
mixin(ViewComponentCalls!("MVCTextAreaFormInput", "DMVCTextAreaFormInput"));

version(test_uim_mvc) { unittest {
  writeln("--- Test in ", __MODULE__, "/", __LINE__);    
}}