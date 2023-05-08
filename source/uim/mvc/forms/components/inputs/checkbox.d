/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.components.inputs.checkbox;

import uim.mvc;
@safe:

class DMVCCheckboxFormInput : DFormInput {
  mixin(ViewComponentThis!("MVCCheckboxFormInput"));

  override void initialize(Json configSettings = Json(null)) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DMVCCheckboxFormInput~"::DMVCCheckboxFormInput("~this.className~"):initialize"); }
    super.initialize(configSettings);

    this
      .fieldValue("false");
  }

  mixin(OProperty!("bool", "checked"));
 
  override DH5Obj h5Input(STRINGAA options = null) {
    super.h5Input(options); 

    auto input = H5Input(name, ["form-check-input me-1"], ["type":"checkbox", "name":inputName]);
    if (!checked) this.checked("checked" in options && options["checked"] == "checked");
    if (checked) input.attribute("checked", "checked");    
    if (entity) { this.fieldValue = entity[fieldName]; }
    if (_crudMode != CRUDModes.Create) input.value(fieldValue);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("readonly","readonly");

    return input;
  }
  
  override DH5Obj h5FormGroup(STRINGAA options = null) {
    super.h5FormGroup(options);

    return BS5FormGroup(["row", "mb-0"],
      H5Label(["form-label col-2 col-form-label"], ""),
      BS5Col(["col"], 
        H5Label(["form-check form-switch"], 
          h5Input(options), H5Span(["form-check-label"], label))));
  }
}
mixin(ViewComponentCalls!("MVCCheckboxFormInput", "DMVCCheckboxFormInput"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DMVCCheckboxFormInput);
    assert(MVCCheckboxFormInput);
  }
}