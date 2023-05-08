/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.pages.headers.header;

import uim.mvc;
@safe:

class DPageHeaderViewComponent : DViewComponent {
  mixin(ViewComponentThis!("PageHeaderViewComponent"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .breadcrumbs(UIMBreadcrumb)
      .headerToolbar(UIMToolbar)
      .printable(true);
  }

  mixin(MVCParameter!("preTitle"));
  mixin(MVCParameter!("title"));
  mixin(OProperty!("string[][]", "actions"));
  mixin(OProperty!("bool", "printable"));
  mixin(MVCParameter!("mainTitle"));
  mixin(MVCParameter!("subTitle"));
  // mixin(MVCParameter!("rootPath"));
  mixin(OProperty!("DUIMBreadcrumbControl", "breadcrumbs"));
  mixin(OProperty!("DUIMToolbarControl", "headerToolbar"));

DH5Obj actionButton(string action, STRINGAA options = null) {
    auto id = this.entity ? this.entity.id.toString : UUID().toString;      
  
    switch(action) {
/*       case "refresh": return buttonLinkRefresh(rootPath); 
      case "create": return buttonLinkCreate(rootPath); 
      case "list": return buttonLinkList(rootPath);  
      case "read": 
      case "view": return buttonLinkView(rootPath, id); 
      case "edit": 
      case "update": return buttonLinkEdit(rootPath, id); 
      case "delete": 
      case "remove": return buttonLinkDelete(rootPath, id); 
      case "version":return null; // Working on it 
      case "lock":return null;  
      case "unlock":return null; 
      case "print":return null; 
      case "export":return null; 
      case "import":return null;*/ 
      default: return null; 
    }
  } 

  auto actionButtons(STRINGAA options = null) {
    return actions.join
      .map!(action => actionButton(action, options)).array;
  } 

  override string render(STRINGAA options = null) {
    // debug writeln("DAPPCreatePageHeader/toString");
    auto h5 = toH5(options);
    return h5 ? h5.map!(a => a.toString).join : "";
  }

  // #region h5
  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);

    if ("rootPath" in options) this.rootPath = options["rootPath"];
    if ("preTitle" in options) this.preTitle = options["preTitle"];
    if ("title" in options) this.title = options["title"];
    if ("actions" in options) this.actions = [options["actions"].split(",")];
    if ("mainTitle" in options) this.mainTitle = options["mainTitle"];
    if ("subTitle" in options) this.subTitle = options["subTitle"];
    // TODO what to do with following?
/*     mixin(OProperty!("DH5Obj", "breadcrumbs"));
    mixin(OProperty!("DEntity", "entity"));
 */  

/*     this
      .headerToolbar
        .buttons(
          pageheaderToolbarButtons(actions, rootPath, entity ? entity["id"] : null)); */
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
     
    return
      [
        UIMPageHeader.printable(printable)(
          UIMRow(["align-items-center mw-100"],
            UIMCol(
              UIMDiv(["mb-1"],
                this.breadcrumbs
              ),
              UIMPageTitle(
                H5Span(["text-truncate"], title)
              )
            ),
            UIMCol.sizes(["auto"])(
              headerToolbar
            )
          )
        )
      ].toH5;
  }
}
mixin(ViewComponentCalls!("PageHeaderViewComponent", "DPageHeaderViewComponent"));
mixin(ViewComponentCalls!("PageHeader", "DPageHeaderViewComponent"));
