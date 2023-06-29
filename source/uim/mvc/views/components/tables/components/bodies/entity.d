/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.tables.components.bodies.entity;

import uim.mvc;

@safe:
class DMVCEntityTableBody : DTableBody {
  mixin(ViewComponentThis!("MVCEntityTableBody"));
}
mixin(ViewComponentCalls!("MVCEntityTableBody", "DMVCEntityTableBody"));
