module uim.baklava.views.components.forms.crud.delete_;

@safe:
import uim.baklava;

class DBKLDeleteForm : DBKLEntityForm {
  mixin(BKLViewComponentThis!("BKLDeleteForm"));

  override void initialize() {
    super.initialize;

    this
      .crudMode(CRUDModes.Delete);
  }
}
mixin(BKLViewComponentCalls!("BKLDeleteForm", "DBKLDeleteForm"));

/* auto deleteheader(string path, DOOPEntity entity, DBKLPanes panes, STRINGAA reqParameters) {  
  return 
    BS5CardHeader( 
      H5H4(["card-title me-auto"], "ID: "~entity.id.toString),
      H5Div(["btn-list"], 
        H5Span(["d-none d-sm-inline"], 
          
        )
      )
    );
} */

/* class DBKLDeletebody_ : DBKLbody_ {
  this() { super();
    _fields = ["name", "display", "description"]; }

  mixin(OProperty!("string", "id"));
  mixin(OProperty!("string", "path"));
  mixin(OProperty!("DOOPEntity", "entity"));
  mixin(OProperty!("DBKLPanes", "panes")); 
  mixin(OProperty!("string[]", "fields")); 
  
  
  DH5Obj[] formGroups(STRINGAA options = null) {
    DH5Obj[] results;

    foreach(field; fields) {
      DH5Obj result = formGroup(field, reqParameters); 
      if (result) results ~= result;
    }

    return results;
  } 

  DH5Obj formGroup(string field, STRINGAA reqParameters) {
    switch(field) {
      case "name": return BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], "Name"),
        BS5Col(["col"], 
          UIMTextInput(["name":"entity_name", "readonly":"readonly"]).value(entity.name)));
      case "display": return BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], "Titel"),
        BS5Col(["col"], 
          UIMTextInput(["name":"entity_display", "readonly":"readonly"]).value(entity.display)));
      case "description": return BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], "Beschreibung"),
        BS5Col(["col"], 
          UIMTextInputarea(["rows":"3", "name":"entity_description", "readonly":"readonly"], entity.description)));
      default: return null; 
    }
  }  */
/* 
  override DH5Obj colContent(STRINGAA options = null) {
    return 
      BS5Col(["col-12"], 
        BS5InputHidden("entity_id", ["name":"entity_id"]).value(entity.id)~
        formGroups(reqParameters)
      );
  } 
}
auto BKLDeletebody_() { return new DBKLDeletebody_(); }

 */