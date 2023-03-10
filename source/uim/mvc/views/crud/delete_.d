/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.crud.delete_;

@safe:
import uim.mvc;

class DAPPEntityDeleteView : DEntityCRUDView {
  mixin(ViewThis!("APPEntityDeleteView"));

override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .crudMode(CRUDModes.Delete)
      .header(
        PageHeader(this)
          .actions([["refresh", "list", "create"]]))
      .form(
        Form(this)
          .crudMode(CRUDModes.Delete)
          .header(
            FormHeader
              .actions([["cancel2root", "finalDelete"], ["view", "version", "edit"], ["print", "export"]])));
  }
}
mixin(ViewCalls!("APPEntityDeleteView"));

version(test_uim_mvc) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DAPPEntityDeleteView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(APPEntityDeleteView); 
}}