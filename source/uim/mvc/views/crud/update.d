/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.crud.update;

@safe:
import uim.mvc;

class DAPPEntityUpdateView : DEntityCRUDView {
  mixin(ViewThis!("APPEntityUpdateView"));

override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    if (auto pgHeader = cast(DPageHeaderViewComponent)this.header) {
      pgHeader.actions([["refresh", "list", "create"]]); }

    if (auto frm = cast(DForm)this.form) {
      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader.actions([["cancel2list", "save"], ["edit", "version", "delete"], ["print", "export"]]); }

      if (auto frmContent = cast(DEntityFormContent)frm.content) {
        frmContent.fields(["name", "display", "description"]); }
    }

    this.crudMode(CRUDModes.Update);
  }
}
mixin(ViewCalls!("APPEntityUpdateView"));

version(test_uim_mvc) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DAPPEntityUpdateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(APPEntityUpdateView); 
}}