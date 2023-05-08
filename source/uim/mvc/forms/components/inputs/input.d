/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.components.inputs.input;

import uim.mvc;
@safe:

class DFormInput : DMVCEntityViewComponent {
  mixin(ViewComponentThis!("FormInput"));

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

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

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
mixin(ViewComponentCalls!("FormInput", "DFormInput"));

///
unittest {
  auto formInput = new DFormInput;

  auto id = "123";
  assert(formInput.inputId(id).inputId == id);

  auto name = "nameOfInput";
  assert(formInput.inputName(name).inputName == name);

  auto name2 = "otherNameOfInput";
  assert(formInput.fieldName(name2).fieldName == name2);

  auto value = "abc";
  assert(formInput.fieldValue(value).fieldValue == value);

  auto label = "abc";
  assert(formInput.label(label).label == label);

  auto pHolder = "type in";
  assert(formInput.placeholder(pHolder).placeholder == pHolder);

  auto feedback = "Something goes wrong";
  assert(formInput.invalidFeedback(feedback).invalidFeedback == feedback);

  auto someFields = ["field1", "field2"];
  assert(formInput.fields(someFields).fields == someFields);

  auto aPath = "/from/here/to/somewhere";
  assert(formInput.path(aPath).path == aPath);
}

version(test_uim_mvc) { unittest {
  assert(new DFormInput);
  assert(FormInput);
}}