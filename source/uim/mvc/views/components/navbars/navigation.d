/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.navbars.navigation;

import uim.mvc;

@safe:
class DMVCNavigationViewComponent : DViewComponent {
  mixin(ViewComponentThis!("MVCNavigationViewComponent"));

  override void initialize(Json configSettings = Json(null)) {
    debugMethodCall(moduleName!DMVCNavigationViewComponent~"::DMVCNavigationViewComponent("~this.className~"):initialize");   
    super.initialize(configSettings);

    // debugwriteln("Add First Nav");
    this
      .firstNavbar(MVCFirstNavbar);

    // debugwriteln("Add Second Nav");
    this
      .secondNavbar(SecondNavbar);
  }

  mixin(OProperty!("DViewComponent", "firstNavbar"));
  mixin(OProperty!("DViewComponent", "secondNavbar"));
  mixin(OProperty!("bool", "fixedTop"));
  
  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
    if (hasError) { return null; }

    // debugwriteln(moduleName!DMVCNavigationViewComponent~":DMVCNavigationViewComponent::toH5");
    auto rootPath = options.get("rootPath", "/");
    // debugwriteln(moduleName!DMVCNavigationViewComponent~":DMVCNavigationViewComponent::toH5 -> internalSessionId = ", options.get("internalSessionId", ""));

    auto firstNavbarH5 = this.firstNavbar   ? this.firstNavbar.toH5(options) 
                                            : null;
    // debugwriteln(firstNavbar ? "Has firstNavbar" : "Missing firstNavbar");
    // debugwriteln("firstNavbar -> ", firstNavbarH5);
    auto secNavbar = cast(DSecondNavbar)this.secondNavbar;
    // debugwriteln(secondNavbar ? "Has secondNavbar" : "Missing secondNavbar");
    auto secondNavbarH5 = secNavbar ? secNavbar.brand(["link":rootPath, "title":options.get("appTitle", "")]).toH5(options) 
                                          : null;
    // debugwriteln("secondNavbar -> ", secNavbar);

    // debugwriteln("return navigation...");

    if (fixedTop) return [H5Div(["sticky-top"], firstNavbarH5~secondNavbarH5)].toH5;
    return firstNavbarH5~secondNavbarH5;
  }
}
mixin(ViewComponentCalls!("MVCNavigationViewComponent", "DMVCNavigationViewComponent"));
mixin(ViewComponentCalls!("MVCNavigation", "DMVCNavigationViewComponent"));
