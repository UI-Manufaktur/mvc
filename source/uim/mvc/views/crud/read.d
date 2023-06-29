/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.crud.read;

import uim.mvc;

@safe:
class DEntityReadView : DEntityCRUDView { // Default view
  mixin(ViewThis!("EntityReadView"));
}
mixin(ViewCalls!("EntityReadView"));

version(test_uim_mvc) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DEntityReadView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(EntityReadView); 
}}