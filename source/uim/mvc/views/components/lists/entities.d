/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.lists.entities;

import uim.mvc;
@safe:

class DAPPEntitiesList : DAPPListViewComponent {
  mixin(ViewComponentThis!("APPEntitiesList"));

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    debug writeln ("%s Entities in DAPPEntitiesList".format(this.entities.length));

    auto listGroup = BS5ListGroup(["list-group-flush", "list-group-hoverable"]);
    if (auto myListItem = cast(DEntityListItem)itemTemplate) {
      foreach(entity; this.entities) {
        listGroup.item(myListItem.entity(entity).toH5(options));
    }}
    this.listContent(StaticViewComponent.h5([listGroup].toH5));
  }
}
mixin(ViewComponentCalls!("APPEntitiesList"));

version(test_uim_mvc) { unittest {
  assert(APPEntitiesList);
}}