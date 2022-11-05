module uim.baklava.views.components.forms.components.inputs.handler;

@safe:
import uim.baklava;

class DBKLFormInputHandler : DBKLEntityFormContent {
  mixin(BKLViewComponentThis!("BKLFormInputHandler"));

  mixin(OProperty!("DBKLFormInput[string]", "formInputs"));
  O addFormInputs(this O)(DBKLFormInput[string] newFormInputs) {
    newFormInputs.byKey.each!(key => formInputs[key] = newFormInputs[key]);
    return cast(O)this;
  }

  override void initialize() {
    super.initialize;

    this
      .formInputs([
        "name": BKLNameFormInput, 
        "display": BKLDisplayFormInput, 
        "description": BKLDescriptionFormInput]);
  } 

/*   override void _afterSetForm() {
    super._afterSetForm;

    foreach(key, formInput; formInputs) {
      if (formInput) formInput.form(this.form);
    }
  } */

  DH5Obj[] group(string field, bool readonly, STRINGAA options = null) {
    debug writeln(moduleName!DBKLFormInputHandler, ":DBKLFormInputHandler::group");
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
        if (auto myFormInput = cast(DBKLFormInput)myInput) {
          return myFormInput.entity(entity).toH5(options);
        }
        return myInput.toH5(options);
    }}
    return null;
  }
}  
mixin(BKLViewComponentCalls!("BKLFormInputHandler", "DBKLFormInputHandler"));
