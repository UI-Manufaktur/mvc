/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.tabs.tabs;

import uim.mvc;

@safe:
class DAPPTabsViewComponent : DViewComponent {
  mixin(ViewComponentThis!("APPTabsViewComponent"));

  mixin(OProperty!("DAPPTabViewComponent[]", "tabs"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPTabsViewComponent~":DAPPTabsViewComponent::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    
    auto tabNav = BS5NavTabs(["nav-tabs-alt"], ["data-bs-toggle":"tabs"]);
    foreach(tab; tabs) tabNav.item(tab.tabNav(options));

    auto tabContent = BS5TabContent;
    foreach(tab; tabs) tabContent(tab.tabPane(options));

    return [
      BS5Card(tabNav).body_(tabContent)].toH5;
  }
}
mixin(ViewComponentCalls!("APPTabsViewComponent"));