/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.crud.read;

@safe:
import uim.mvc;

class DAPPEntityReadView : DEntityCRUDView { // Default view
  mixin(ViewThis!("APPEntityReadView"));
}
mixin(ViewCalls!("APPEntityReadView"));

version(test_uim_mvc) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DAPPEntityReadView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(APPEntityReadView); 
}}