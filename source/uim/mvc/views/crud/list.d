/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.crud.list;

import uim.mvc;

@safe:
class DEntitiesListView : DEntitiesView {
  mixin(ViewThis!("EntitiesListView")); // , false, true));

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("bool", "readonly"));
  mixin(OViewComponent!("form", "form"));
  
override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
    debugMethodCall(moduleName!DEntitiesListView~"::DEntitiesListView("~this.className~"):initialize");    

    this.header(
      PageHeader(this)
        .actions([["refresh", "create"]]));
    
    this.form(
      EntitiesListForm(this));
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntitiesListView~"::DEntitiesListView("~this.name~"):toH5");    
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

    DViewComponent myHeader = cast(DViewComponent)this.header;
    DViewComponent myMessages = cast(DViewComponent)this.messages;
    DViewComponent myForm = cast(DViewComponent)this.form;
    DViewComponent myFooter = cast(DViewComponent)this.footer;

    return [
      H5Div(["container-xl"],
        myHeader.toH5(options)~ 
        BS5Row("messages", ["mb-2"], myMessages.toH5(options))~
        BS5Row(["row-deck row-cards mb-2"], myForm.toH5(options))~
        myFooter.toH5(options)
      )].toH5;             
  }
}
mixin(ViewCalls!("EntitiesListView"));

version(test_uim_mvc) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DEntitiesListView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(EntitiesListView); 
}}