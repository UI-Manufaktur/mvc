/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.components.inputs.text;

@safe:
import uim.mvc;

class DMVCTextFormInput : DMVCFormInput {
  mixin(MVCViewComponentThis!("MVCTextFormInput"));

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    auto input = UIMTextInput
      .id(inputId).name(inputName).placeholder(placeholder)
      .readonly(readonly)
      .addAttributes(["autocomplete":"off"]);

    if (crudMode == CRUDModes.Read || crudMode == CRUDModes.Delete) input.readonly(true);
    input.value(fieldValue).invalidText(invalidFeedback);

    return [
      BS5FormGroup(id, ["row", "mb-1"],
        H5Label(labelId, ["form-label col-2 col-form-label required"], label),
        input
      )
    ].toH5;
  }
}
mixin(MVCViewComponentCalls!("MVCTextFormInput", "DMVCTextFormInput"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

  }}
