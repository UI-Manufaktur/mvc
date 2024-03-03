/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.components.inputs.handler;

import uim.mvc;

@safe:
class DFormInputHandler : DFormComponent {
  mixin(ViewComponentThis!("FormInputHandler"));

  mixin(OProperty!("DFormInput[string]", "formInputs"));
  O addFormInputs(this O)(DFormInput[string] newFormInputs) {
    newFormInputs.byKey.each!(key => formInputs[key] = newFormInputs[key]);
    return cast(O)this;
  }

  override bool initialize(IData[string] configSettings = null) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DFormInputHandler~"::DFormInputHandler("~this.className~"):initialize"); }
    super.initialize(configSettings);

    this
      .formInputs([
        "name": MVCNameFormInput, 
        "display": DisplayFormInput, 
        "description": DescriptionFormInput
      ]);
  } 

/*   override void _afterSetForm() {
    super._afterSetForm;

    foreach(key, formInput; formInputs) {
      if (formInput) formInput.form(this.form);
    }
  } */

  DH5Obj[] group(string field, bool readonly, STRINGAA options = null) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DFormInputHandler, ":DFormInputHandler::group"); }
    version(test_uim_mvc) { debugMethodCall("--> CrudMode:", this.crudMode); }

/*     foreach(key, formInput; formInputs) {
      if (formInput) formInput.form(this.form);
    } */

    debug writeln(entity ? ("Found entity: %s".format(entity.name)) : "entity missing");
    if (entity) {
      debug writeln("Found entity:", entity.name);
      
      if (auto myInput = this.formInputs.get(field.toLower, null)) { // field name not case sensitive !
        debug writeln("Found formGroup for field:", field);
        myInput.crudMode(this.crudMode)/* .form(form) */;
        if (auto myFormInput = cast(DFormInput)myInput) {
          return myFormInput.entity(entity).toH5(options);
        }
        return myInput.toH5(options);
    }}
    return null;
  }
}  
mixin(ViewComponentCalls!("FormInputHandler", "DFormInputHandler"));
