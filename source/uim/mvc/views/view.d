/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.view;

@safe:
import uim.mvc;

/**
 * View, the V in the MVC triad. View interacts with Helpers, ViewComponents and view variables passed
 * in from the controller to render the results of the controller action. Often this is HTML,
 * but can also take the form of JSON, XML, PDF"s or streaming files.
 *
 * UIM uses a two-step-view pattern. This means that the template content is rendered first,
 * and then inserted into the selected layout. This also means you can pass data from the template to the
 * layout using `this.set()`
 *
 * View class supports using plugins as themes. You can set
 *
 * ```
 * void beforeRender(IEvent myEvent) {
 *  this.viewBuilder().setTheme("SuperHot");
 * }
 * ```
 *
 * in your Controller to use plugin `SuperHot` as a theme. Eg. If current action
 * is PostsController::index() then View class will look for template file
 * `plugins/SuperHot/templates/Posts/index.php`. If a theme template
 * is not found for the current action the default app template file is used.
 *
 * @property uim.mvc.views\Helper\BreadcrumbsHelper $Breadcrumbs
 * @property uim.mvc.views\Helper\FlashHelper $Flash
 * @property uim.mvc.views\Helper\FormHelper $Form
 * @property uim.mvc.views\Helper\HtmlHelper $Html
 * @property uim.mvc.views\Helper\NumberHelper $Number
 * @property uim.mvc.views\Helper\PaginatorHelper $Paginator
 * @property uim.mvc.views\Helper\TextHelper $Text
 * @property uim.mvc.views\Helper\TimeHelper $Time
 * @property uim.mvc.views\Helper\UrlHelper myUrl
 * @property uim.mvc.views\ViewBlock $Blocks
 */
class DView : DMVCBase, IView { 
  mixin(ViewThis!("View"));

  override void initialize(DConfig configSettings = null) {
    super.initialize(configSettings);

    this
      .layoutName("default");

  }
  
  // #region Properties
    mixin(OProperty!("IController", "controller"));  
    mixin(OProperty!("DEntity", "entity"));
    mixin(OProperty!("DEntity[]", "entities"));
    mixin(OProperty!("string", "rootPath"));

    // The name of the layout render the template inside of. 
    mixin(OProperty!("string", "layoutName"));
  // #endregion Properties

  // Helpers collection
  // protected DVIWHelperRegistry _helpers;

  // ViewBlock instance.
  // protected DViewBlock viewBlock;

  // The name of the plugin.
  protected string _pluginName;

  void beforeH5(STRINGAA options = null) {
    // 
  }

  void afterH5(STRINGAA options = null) {
    // 
  }

  DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DView~":DView("~this.name~")::toH5");
    beforeH5(options);
    DH5Obj[] result;     
    afterH5(options);  
    return result;
  }

  void beforeRender(STRINGAA options = null) {
    // 
  }

  void afterRender(STRINGAA options = null) {
    // 
  }

  string render(STRINGAA options = null) {
    beforeRender(options);
    auto result = toH5(options).toString;
    afterRender(options);
    return result;
  }
}
mixin(ViewCalls!("View", "DView"));

version(test_uim_mvc) { unittest { 
  testView(View, "View");

  assert(View.name == "View");
  assert(View.create.name == "View");
  assert(View.clone.name == "View");
}} 
