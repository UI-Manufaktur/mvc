/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.crud.entity;

import uim.mvc;
@safe:

class DEntityCRUDView : DEntityView {
  mixin(ViewThis!("EntityCRUDView"));

  mixin(OProperty!("bool", "readonly", "CRUDModes.Read", true, true, "", `
    foreach(component; this.components.all) {
      if (auto frm = cast(DForm)component) {
        frm.readonly(this.readonly); }}`));

  mixin(OProperty!("DViewComponent", "form"));
  mixin(OProperty!("DUIMTabControl", "entityTab"));

override void initialize(Json configSettings = Json(null)) {
    debugMethodCall(moduleName!DEntityCRUDView~"::DEntityCRUDView("~this.className~"):initialize");   
    super.initialize(configSettings);

    this
      .header(
        PageHeader(this)
          .actions([["refresh", "list", "create"]]))
      .entityTab(
        UIMTab
          .panes([
            UIMTabPane
              .title("Allgemein")
              .content(
                H5Div("This is a primary pane")
              ),
            UIMTabPane
              .title("Beschreibungen")
              .content(
                H5Div("This is a secondary pane")
              ),
            UIMTabPane
              .title("Versionen")
              .content(
                H5Div("This is a third pane")
              )                        
          ])
      )
      .form(
        Form(this)
          .header(
            FormHeader
              .actions([["edit", "version", "delete"], ["print", "export"]]))
          .content(
            EntityFormContent))    
      .crudMode(CRUDModes.Read);
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntityCRUDView~"::DEntityCRUDView("~this.name~"):beforeH5");    
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    debug writeln(this.entity ? "Has entity "~this.entity.name : "ENtity missing");
    if (auto myForm = cast(DEntityForm)this.form) {
      debug writeln("Found DForm");
      myForm.entity(this.entity);

      if (auto myFormContent = cast(DEntityFormContent)myForm.content) {
        myFormContent.entity(this.entity);
      }
    } 
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntityCRUDView~"::DEntityCRUDView("~this.name~"):toH5");    
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    
    return [
      H5Div(["container-xl"],
        (this.header ? this.header.toH5(options) : null)~ 
        (this.components["messages"].notNull ? BS5Row("messages", ["mb-2"], this.components["messages"].toH5(options)) : null)~
        BS5Row(["row-deck row-cards mb-2"], form.toH5(options))~
        BS5Row(["row-deck row-cards mb-2"], H5Div(["col-12"], entityTab))~
        (this.footer ? this.footer.toH5(options) : null)
      )].toH5;             
  }
}
mixin(ViewCalls!("EntityCRUDView"));

version(test_uim_mvc) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DEntityCRUDView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(EntityCRUDView); 
}}