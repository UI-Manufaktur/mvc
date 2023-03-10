/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.crud.list;

@safe:
import uim.mvc;

class DAPPEntitiesListView : DEntitiesView {
  mixin(ViewThis!("APPEntitiesListView")); // , false, true));

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("bool", "readonly"));
  mixin(OViewComponent!("form", "form"));
  
override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
    debugMethodCall(moduleName!DAPPEntitiesListView~"::DAPPEntitiesListView("~this.name~"):initialize");    

    this
      .header(
        PageHeader(this)
          .actions([["refresh", "create"]]))
      .form(
        EntitiesListForm(this));
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntitiesListView~"::DAPPEntitiesListView("~this.name~"):toH5");    
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

    return [
      H5Div(["container-xl"],
        this.header.toH5(options)~ 
        BS5Row("messages", ["mb-2"], this.messages.toH5(options))~
        BS5Row(["row-deck row-cards mb-2"], this.form.toH5(options))~
        this.footer.toH5(options)
      )].toH5;             
  }
}
mixin(ViewCalls!("APPEntitiesListView"));

version(test_uim_mvc) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DAPPEntitiesListView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(APPEntitiesListView); 
}}