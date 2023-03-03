/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.entitiesx.entity;

@safe:
import uim.mvc;

class DEntityViewComponent : DViewComponent {
  mixin(ViewComponentThis!("EntityViewComponent")); // , true));

  // mixin(OProperty!("DEntity", "entity"));
} 
mixin(ViewComponentCalls!("EntityViewComponent")); // , true));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    // TODO
  }
} 