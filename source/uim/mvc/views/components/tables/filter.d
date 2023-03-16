/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.tables.filter;

@safe:
import uim.mvc;

class DMVCEntitiesTableFilter : DViewComponent {
  this() { super(); this.visibleEntities(10); }
  this(DView myView) { this().view(myView); }

  mixin(OProperty!("size_t", "visibleEntities"));
  
  override DH5Obj[] toH5(STRINGAA options = null) {
    return [
      H5Tr
        .th()
        .th()
        .th()
        .th("filterName")
        .th("filterDisplay")
        .th()];
  }
}
auto MVCEntitiesTableFilter() { return new DMVCEntitiesTableFilter; }

version(test_uim_mvc) { unittest {
  assert(MVCEntitiesTableFilter);
}}