module uim.baklava.views.components.pages.headers.header;

@safe:
import uim.baklava;

class DBKLPageHeaderViewComponent : DBKLViewComponent {
  mixin(BKLViewComponentThis!("BKLPageHeaderViewComponent"));

  override void initialize() {
    super.initialize;

    this
      .breadcrumbs(UIMBreadcrumb)
      .headerToolbar(UIMToolbar)
      .printable(true);
  }

  mixin(BKLParameter!("preTitle"));
  mixin(BKLParameter!("title"));
  mixin(OProperty!("string[][]", "actions"));
  mixin(OProperty!("bool", "printable"));
  mixin(BKLParameter!("mainTitle"));
  mixin(BKLParameter!("subTitle"));
  mixin(BKLParameter!("rootPath"));
  mixin(OProperty!("DUIMBreadcrumbControl", "breadcrumbs"));
  mixin(OProperty!("DUIMToolbarControl", "headerToolbar"));

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
    mixin(OProperty!("DOOPEntity", "entity"));
 */  

    this
      .headerToolbar
        .buttons(
          pageheaderToolbarButtons(actions, rootPath, entity ? entity["id"] : null));
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
mixin(BKLViewComponentCalls!("BKLPageHeaderViewComponent", "DBKLPageHeaderViewComponent"));
mixin(BKLViewComponentCalls!("BKLPageHeader", "DBKLPageHeaderViewComponent"));
