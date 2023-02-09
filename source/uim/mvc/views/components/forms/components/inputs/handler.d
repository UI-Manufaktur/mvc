module uim.mvc.views.components.forms.components.inputs.handler;

@safe:
import uim.mvc;

class DFormInputHandler : DMVCEntityFormContent {
  mixin(ViewComponentThis!("MVCFormInputHandler"));

  mixin(OProperty!("DFormInput[string]", "formInputs"));
  O addFormInputs(this O)(DFormInput[string] newFormInputs) {
    newFormInputs.byKey.each!(key => formInputs[key] = newFormInputs[key]);
    return cast(O)this;
  }

  override void initialize(Json configSetting = Json(null)) {
    super.initialize(configSettings);

    this
      .formInputs([
        "name": MVCNameFormInput, 
        "display": MVCDisplayFormInput, 
        "description": MVCDescriptionFormInput]);
  } 

/*   override void _afterSetForm() {
    super._afterSetForm;

    foreach(key, formInput; formInputs) {
      if (formInput) formInput.form(this.form);
    }
  } */

  DH5Obj[] group(string field, bool readonly, STRINGAA options = null) {
    debug writeln(moduleName!DFormInputHandler, ":DFormInputHandler::group");
    debug writeln("CrudMode:", this.crudMode);

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
mixin(ViewComponentCalls!("MVCFormInputHandler", "DFormInputHandler"));
