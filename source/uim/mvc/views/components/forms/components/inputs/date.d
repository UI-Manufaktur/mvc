module uim.baklava.views.components.forms.components.inputs.date;

@safe:
import uim.baklava;

class DBKLDateFormInput : DBKLFormInput {
  mixin(BKLViewComponentThis!("BKLDateFormInput"));

  override DH5Obj h5Input(STRINGAA options = null) {
    super.h5Input(options);

    auto input = BS5InputDate("entity_validFrom", ["name":"entity_validFrom"]);
    if (readonly) input.attribute("readonly","readonly");
    if (this.crudMode != CRUDModes.Create) {
      input.value(entity["validFrom"]);
    }
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("readonly","readonly");

    return input;
  }

  override DH5Obj h5FormGroup(STRINGAA options = null) {
    super.h5FormGroup(options); 

    return
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], label),
        BS5Col(["col"], h5Input(options)));
  }

  override void beforeH5(STRINGAA options = null) { // hook
    super.beforeH5(options);
    if (hasError) { return; }
  }
}
mixin(BKLViewComponentCalls!("BKLDateFormInput", "DBKLDateFormInput"));

version(test_baklava) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    // 
}}
