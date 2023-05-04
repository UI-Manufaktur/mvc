/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.search;

import uim.mvc;
@safe:

class DAPPSearchInList : DViewComponent {
  this() { super(); }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    return [ 
      H5Div(["ms-auto text-muted"], 
        H5Div(["input-group input-group-sm input-group-flat"], 
          UIMTextInput("inputSearch", ["autocomplete":"off", "placeholder":"Suche in "~options.get("entitiesName", "")]), 
          H5Div(["invalid-feedback"], "Der Suchtext ist ungültig. Keine Sonderzeichen verwenden."),
          H5Span(["input-group-text"],
            H5A("btnClearSearch", ["link-secondary"], 
              ["href":"#", "title":"", "data-bs-toggle":"tooltip", "data-bs-original-title":"Suche löschen"], tablerIcon("x", ["text-uim"]))
          )))].toH5;
  }
}
auto APPSearchInList() { return new DAPPSearchInList; }