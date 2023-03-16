/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.components.inputs.startenddate;

@safe:
import uim.mvc;

class DMVCStartEndDateFormInput : DFormInput {
  mixin(ViewComponentThis!("MVCStartEndDateFormInput"));

  DH5Obj h5StartInput(STRINGAA options = null) {
    super.h5Input(options);

    auto input = BS5InputDate("entity_validFrom", ["name":"entity_validFrom"]);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("readonly","readonly");
    if (readonly) { input.attribute("readonly","readonly"); }
    if (this.crudMode != CRUDModes.Create) {
      if (entity) {
        input.value(entity["validFrom"]);
      }
    } 

    return input;
  }

  DH5Obj h5EndInput(STRINGAA options = null) {
    super.h5Input(options);

    auto input = BS5InputDate("entity_validUntil", ["name":"entity_validUntil"]);
    if (readonly) {
      input.attribute("readonly","readonly");
    }
    if (this.crudMode != CRUDModes.Create) {
      if (entity) {
        input.value(entity["validUntil"]);
      }
    } 

    return input;
  }

  override DH5Obj h5FormGroup(STRINGAA options = null) {
    super.h5FormGroup(options); 

    return
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], label),
        BS5Col(["col-5"], 
          H5Div(
            H5Label(["form-label mb-0"], "Ab"),
            H5Div(["input-icon"], 
              H5Span(["input-icon-addon"], tablerIcon("calendar")),
              h5StartInput(options)))),
        BS5Col(["col-5"], 
          H5Div(
            H5Label(["form-label mb-0"], "Bis"),
            H5Div(["input-icon"], 
              H5Span(["input-icon-addon"], tablerIcon("calendar")),
              h5EndInput(options)))));
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    return 
      [
        BS5FormGroup(id, ["row", "mb-1"],
          H5Label(labelId, ["form-label col-2 col-form-label required"], label),
          BS5Col(["col"], 
            h5Input(options), H5Div(["invalid-feedback"], invalidFeedback)))
      ].toH5;
  }
  version(test_uim_mvc) {
    unittest {
      writeln("--- Test in ", __MODULE__, "/", __LINE__);
      // 
      }}
}
mixin(ViewComponentCalls!("MVCStartEndDateFormInput", "DMVCStartEndDateFormInput"));