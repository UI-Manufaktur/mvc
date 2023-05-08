/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.navbars.slot;

import uim.mvc;
@safe:

class DNavbarSlotViewComponent : DViewComponent {
    mixin(ViewComponentThis!("NavbarSlotViewComponent"));

    mixin(OProperty!("bool", "active"));
    mixin(OProperty!("string", "title"));
    mixin(OProperty!("DBS5DropdownMenu", "menu"));

/*     override string toString() { return toString(null); }
    string toString(STRINGAA options = null) {   
        if (_id.length > 0) _content.id(_id);
        if (_active) _content.classes("active"); else _content.removeClasses("active");
        return _content.toString();
    }
 */
    override void beforeH5(STRINGAA options = null) {
        super.beforeH5(options);
        if (hasError) { return; }
    }

    override DH5Obj[] toH5(STRINGAA options = null) {
        super.toH5(options);

    return [
      UIMDropdownNavItem( 
        UIMNavLink(["dropdown-toggle"], ["data-bs-toggle":"dropdown", "role":"button", "aria-expanded":"false"])
          .link("#navbar-slot")
          .title(title),
        menu
      )].toH5;
    }
}
mixin(ViewComponentCalls!("NavbarSlotViewComponent", "DNavbarSlotViewComponent"));
