/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.view;

import uim.mvc;
@safe:

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
 */
class DView : DMVCObject, IView { 
  mixin(ViewThis!("View"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .layoutName("default");

  }
  
  bool isNull() {
    return false;
  }

  // #region Properties
    mixin(OProperty!("DEntity", "entity"));
    mixin(OProperty!("DEntity[]", "entities"));
    mixin(OProperty!("string", "rootPath"));

  mixin(OProperty!("DViewComponents", "components"));
  mixin(OProperty!("DController", "controller")); 
  // mixin(OProperty!("IEventManager", "eventManager")); 
  mixin(OProperty!("string[]", "leftClasses")); 
  mixin(OProperty!("string[]", "middleClasses")); 
  mixin(OProperty!("string[]", "rightClasses")); 
  mixin(OProperty!("STRINGAA", "rightAttributes")); 
    
  mixin(OViewComponent!("header"));
  mixin(OViewComponent!("footer"));
  mixin(OViewComponent!("left"));
  mixin(OViewComponent!("middle"));
  mixin(OViewComponent!("right"));
  mixin(OViewComponent!("messages"));
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
    debugMethodCall(moduleName!DView~":DView("~this.name~")::beforeH5");
    // init
    _error = null; // Delete last error
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

  override DMVCObject clone() {
    auto result = create;
    if (auto myView = cast(DView)result) { myView.controller(this.controller); }
    return result.fromJson(this.toJson);
  }
}
mixin(ViewCalls!("View", "DView"));

version(test_uim_mvc) { unittest { 
  testView(View, "View");

  assert(View.name == "View");
  assert(View.create.name == "View");
  assert(View.clone.name == "View");
}} 

/*

/*

class DView : DView, IEventDispatcher {
  mixin(ViewThis!("View"));

  // Initialization (= hook method)
override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    debugMethodCall(moduleName!DView~"::DView("~this.className~"):initialize");   
    super.initialize;

    this
      .name("View") 
      .components(
        ViewComponents(this))
      .links(MVCLinkContainer) 
      .metas(MVCMetaContainer) 
      .scripts(ScriptContainer) 
      .styles(StyleContainer)
      .leftClasses(["d-none", "d-md-block", "col-12", "col-sm-6", "col-md-4", "col-lg-3", "col-xl-2"])
      .middleClasses(["col-12", "col-md-8", "col-lg-6", "col-xl-8"]) 
      .rightClasses(["d-none", "d-lg-block", "col-12", "col-sm-6", "col-md-4", "col-lg-3", "col-xl-2"]);
  }

  mixin(OProperty!("DViewComponents", "components"));
  mixin(OProperty!("DPageController", "controller")); 
  mixin(OProperty!("IEventManager", "eventManager")); 
  mixin(OProperty!("string[]", "leftClasses")); 
  mixin(OProperty!("string[]", "middleClasses")); 
  mixin(OProperty!("string[]", "rightClasses")); 
  mixin(OProperty!("STRINGAA", "rightAttributes")); 
    
  mixin(OViewComponent!("header"));
  mixin(OViewComponent!("footer"));
  mixin(OViewComponent!("left"));
  mixin(OViewComponent!("middle"));
  mixin(OViewComponent!("right"));
  mixin(OViewComponent!("messages"));

/*   DETBBase _database; 
  O database(this O)(DETBBase aDatabase) { 
    _database = aDatabase; 
    return cast(O)this; }

  DETBBase database() {
    if (_database) { return _database; } // has his own database
    if (this.controller && this.controller.database) { return this.controller.database; } // owner class has database
    return null; // no database found
  } * /

  protected DAPPLayout _layout;
  O layout(this O)(DAPPLayout newLayout) { 
      debugMethodCall(moduleName!DView~":DView("~this.name~")::layout"); 
      _layout = newLayout;
      return cast(O)this; 
  }
  DAPPLayout layout() {
      if (_layout) return _layout;
      if (this.controller) { return this.controller.layout; }
      return null;
  }

  // Containers
  mixin(OProperty!("DMVCLinkContainer", "links"));
  mixin(OProperty!("DMVCMetaContainer", "metas"));
  mixin(OProperty!("DScriptContainer", "scripts"));
  mixin(OProperty!("DStyleContainer", "styles"));

  mixin(OProperty!("STRINGAA", "bindings"));

  override string opIndex(string key) {
    switch(key) {
      default: return super.opIndex(key);
    }
  }

  O addComponent(this O)(DViewComponent newComponent) {
    if (newComponent) this.components.set(newComponent.id, newComponent);
    return cast(O)this;
  }

  O addComponent(this O)(string anId, DViewComponent newComponent) {
    if (newComponent) this.components.set(anId, newComponent);
    return cast(O)this;
  }

  // #region h5 content
  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DView~":DView("~this.name~")::beforeH5");
    super.beforeH5(options);

    debug writeln("In DView -> %s components".format(this.components.length));
    this.components.all.each!(comp => comp.rootPath(this.rootPath));
  }

  DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DView~":DView("~this.name~")::toH5"); 
    beforeH5(options);

    auto container = BS5Container.fluid();
    if (this.components["messages"].notNull) {
      container
        .row("messages", ["section"], this.components["messages"].toH5(options));
    }

    return [
      H5Main(["content"], ["style":"margin-bottom:200px"],
        (this.header ? this.header.toH5(options) : null)~
        BS5Row(["mt-2 row-cards"], 
          container
            .row(["section"], 
              BS5Col(this.leftClasses, this.left ? this.left.toH5(options) : null),
              BS5Col(this.middleClasses, this.middle ? this.middle.toH5(options) : null),
              BS5Col(rightClasses, rightAttributes, this.right ? this.right.toH5(options) : null)))~
        (this.footer ? this.footer.toH5(options) : null)
      )
    ].toH5;

/* H5Div(["wrapper"], 
        head~
        H5Div(["page-wrapper bg-white"],
          pHeader ? BS5Container.fluid()(pHeader.toH5(options)) : null,
          H5Div(["page-body"], H5Div(["container-fluid"], view.toH5(options)))
        ).toString
        // foot
      ).toString,
 * /      

    }
    // #endregion h5

  // #region render
    /// Renders view
    /// Render triggers helper callbacks, which are fired before and after the template are rendered.
    /// The helper callbacks are called: `beforeRender`, `afterRender`
    void beforeRender(STRINGAA options = null) {
      debugMethodCall(moduleName!DView~":DView::beforeRender"); 
    }

    string afterRender(string renderedContent, STRINGAA options = null) {
      debugMethodCall(moduleName!DView~":DView::afterRender"); 

      foreach (key, value; bindings) {
          renderedContent = renderedContent.replace("{{"~key~"}}", value);
      }

      return renderedContent; 
    }

    string render(STRINGAA options = null) {
      debugMethodCall(moduleName!DView~":DView::render"); 

      beforeRender(options);
      if (hasError) { return null; }
      
      // render
      auto h5content = toH5(options).map!(h5 => h5.toString).join;

      if (this.layout) {
          debug writeln("View has layout -> ", this.layout.name);
      }
      else {
          debug writeln("View has no layout");
      }
      string renderedLayout  = this.layout ? this.layout.render(this.controller, h5content, options) 
                                      : h5content;

      // 4. final works like bindings {{x}}
      auto finalRender = afterRender(renderedLayout, options); 
      if (hasError) { return null; }

      return finalRender; }
  // #endregion render 
}
mixin(ViewCalls!("View"));

version(test_uim_apps) { unittest {
		testView(new DView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(View); 
}}


*/