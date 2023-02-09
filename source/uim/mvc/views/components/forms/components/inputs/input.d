/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.components.inputs.input;

@safe:
import uim.mvc;

class DFormInput : DMVCEntityViewComponent {
  mixin(ViewComponentThis!("MVCFormInput"));

  // #region Fields
    // id of label element
    mixin(OProperty!("string", "labelId")); 

    mixin(OProperty!("bool", "readonly")); 

    // id of input element
    mixin(OProperty!("string", "inputId")); 
    mixin(OProperty!("string", "inputName"));
    mixin(OProperty!("string", "fieldName"));
    mixin(OProperty!("string", "fieldValue"));
    mixin(OProperty!("string", "label"));
    mixin(OProperty!("string", "placeholder"));
    mixin(OProperty!("string", "invalidFeedback"));
    mixin(OProperty!("string[]", "fields"));
    mixin(OProperty!("string", "path"));
    // mixin(OProperty!("DMVCPanes", "panes"));
  // #endregion Fields

  override void initialize(Json configSetting = Json(null)) {
    super.initialize(configSetting);

    this
      .id("forminput-%s".format(uniform(1, 1_000)))
      .labelId(id~"-label")
      .inputId(id~"-input")
      .crudMode(CRUDModes.Create)
      .fields(["name", "display", "description"]); 
  }

  DH5Obj h5Input(STRINGAA options = null) {
    auto input = H5Input(inputId, ["type": "text"]);
    if (crudMode == CRUDModes.Read || crudMode == CRUDModes.Delete) input.attribute("readonly","readonly");

    return input;
  }

  DH5Obj h5FormGroup(STRINGAA options = null) {
    return 
      BS5FormGroup(["row", "mb-1"],
        H5Label(labelId, ["form-label col-2 col-form-label required"], label),
        BS5Col(["col"], 
          h5Input(options), 
          (invalidFeedback ? H5Div(["invalid-feedback"], invalidFeedback) : null)));
  }

  override void beforeH5(STRINGAA options = null) { // hook
    super.beforeH5(options);
    if (hasError) { return; }

    if (entity /* TODO ADD! && entity has fieldName */) {      
      this.fieldValue = entity[fieldName];
    }
 }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
    if (hasError) { return null; }

    return [
      h5FormGroup(options)
      ];
  }
}
mixin(ViewComponentCalls!("MVCFormInput", "DFormInput"));

version(test_uim_mvc) { unittest {
  assert(new DFormInput);
  assert(MVCFormInput);
}}