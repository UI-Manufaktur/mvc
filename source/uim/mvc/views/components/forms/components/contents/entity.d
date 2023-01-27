/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.components.contents.entity;

@safe:
import uim.mvc;

class DMVCEntityFormContent : DMVCFormContent {
  mixin(MVCViewComponentThis!("MVCEntityFormContent"));

  override void initialize() {
    debugMethodCall(moduleName!DMVCEntityFormContent~"::DMVCEntityFormContent("~this.name~"):initialize");   
    super.initialize;

    this
    .id("FormContent_%s".format(uniform(1, 1_000)))
    .crudMode(CRUDModes.Create)
    .fields(["name", "display", "description"])
    .inputHandler(MVCFormInputHandler(/* this.form */));   
  }

  // mixin(OProperty!("DEntity", "entity"));

  mixin(OProperty!("string[]", "fields"));
  O addFields(this O)(string[] newFields) {
    _fields ~= newFields;
    return cast(O)this;
  }
  
  // mixin(OProperty!("DMVCPanes", "panes"));

  mixin(OProperty!("DMVCFormInputHandler", "inputHandler"));

  DH5Obj[] formGroups(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCEntityFormContent~"::DMVCEntityFormContent:formGroups");    
    DH5Obj[] results;

    debug writeln(entity ? "Has entity: "~entity.name : "No entity");

    if (auto myInputHandler = cast(DMVCFormInputHandler)inputHandler) {
      debug writeln("Found inputHandler:",inputHandler.name);

      myInputHandler
        /* .form(this.form) */
        .crudMode(this.crudMode)
        .entity(entity);

      debug writeln("CrudMode:", this.crudMode);
      debug writeln("Entity:", this.entity ? this.entity.name : "- missing -");

      foreach(field; this.fields) {     
        debug writeln("formGroup:", field);

        final switch(crudMode) {
          case CRUDModes.Create: results ~= myInputHandler.group(field, false, options); break;
          case CRUDModes.Read:   results ~= myInputHandler.group(field, true,  options); break;
          case CRUDModes.Update: results ~= myInputHandler.group(field, false, options); break;
          case CRUDModes.Delete: results ~= myInputHandler.group(field, true,  options); break;
        }
    }} 

    return results;
  }  

  DH5Obj bodyContent(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCEntityFormContent~"::DMVCEntityFormContent:bodyContent");    
    DH5Obj row = BS5Row();
    
    auto col = BS5Col(["col-12"], 
      BS5InputHidden("sessionToken", ["name":"sessionToken"]).value(options.get("sessionToken", null)));
    
    debug writeln(entity ? "Found entity : "~entity.name : "No entity");
    if (entity) {
      col(BS5InputHidden("entity_id", ["name":"entity_id"]).value(entity.id.toString));
    }

    if (auto fGroups = formGroups(options)) {
      debug writeln("Found formgroups");
      col(fGroups);
    }

    return 
      row(
        col);    
  } 

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCEntityFormContent~"::DMVCEntityFormContent:toH5");    
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

    return [
      BS5CardBody(id,
        bodyContent(options)
    )].toH5; 
  }
}
mixin(MVCViewComponentCalls!("MVCEntityFormContent", "DMVCEntityFormContent"));

version(test_uim_mvc) { unittest {
  assert(MVCEntityFormContent);
}}