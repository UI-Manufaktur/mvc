/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.filters;

@safe:
import uim.mvc;

DH5Obj filterName() {
  return 
    BS5InputGroup(["input-group-flat input-group-sm"], 
      UIMTextInput("filterName", ["aria-label":"Filter display", "autocomplete":"off"]).size("sm"),
      H5Span(["input-group-text"], 
        H5A("btnClearFilterName", ["link-secondary"], ["href":"#"], tablerIcon("filter-off"))));
}

DH5Obj filterDisplay() {
  return 
    BS5InputGroup(["input-group-flat input-group-sm"], 
      UIMTextInput("filterDisplay", ["aria-label":"Filter display", "autocomplete":"off"]).size("sm"),
      H5Span(["input-group-text"], 
        H5A("btnClearFilterDisplay", ["link-secondary"], ["href":"#"], tablerIcon("filter-off"))));
}
