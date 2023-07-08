/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.component;

import uim.mvc;

@safe:
class DViewComponent : DMVCObject, IViewComponent, IViewComponentManager {
  mixin(ViewComponentThis!("ViewComponent"));

  mixin(TProperty!("IViewComponentManager", "manager"));

  mixin(TProperty!("IViewComponent[]", "components"));
  mixin ViewComponentManagerTemplate;

  mixin EntityBaseTemplate;

  override void initialize(Json configSettings = Json(null)) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DViewComponent~":DViewComponent("~this.name~")::initialize"); }
    super.initialize(configSettings);

    this
      .id(this.name)
      .changed(true)
      .dynamic(true)
      .notNull(true);

    components(null);
  }

  mixin(OProperty!("string", "id"));

  mixin(OProperty!("DEntity", "entity"));
  mixin(OProperty!("DEntity[]", "entities"));
  mixin(MVCParameter!("rootPath"));

  mixin(OProperty!("bool", "showHeader"));
  mixin(OProperty!("bool", "showFooter"));

  mixin(OProperty!("bool", "dynamic")); 
  mixin(OProperty!("bool", "isNull")); 
  mixin(OProperty!("bool", "notNull")); 
  mixin(OProperty!("STRINGAA", "style")); 
  mixin(OProperty!("bool", "changed")); 
  mixin(OProperty!("DView", "view")); // Owning  view
  mixin(OProperty!("DLayout", "layout")); 
  mixin(MVCParameter!("jsCode")); 
  mixin(MVCParameter!("debugPrefix")); 

  mixin(OProperty!("string[]", "classes"));
  mixin(OProperty!("string[string]", "attributes"));

  void beforeH5(STRINGAA options = null) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DViewComponent~":DViewComponent("~this.name~")::beforeH5"); }
    // 
  }

  void afterH5(STRINGAA options = null) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DViewComponent~":DViewComponent("~this.name~")::beforeH5"); }
  }

  DH5Obj[] toH5(STRINGAA options = null) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DViewComponent~":DViewComponent("~this.name~")::toH5"); }

    beforeH5(options);
    DH5Obj[] result;     
    afterH5(options);  

    return result;
  }

  void beforeRender(STRINGAA options = null) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DViewComponent~":DViewComponent("~this.name~")::beforeRender"); }
  }

  void afterRender(STRINGAA options = null) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DViewComponent~":DViewComponent("~this.name~")::afterRender"); }
  }

  string render(STRINGAA options = null) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DViewComponent~":DViewComponent("~this.name~")::render"); }
    beforeRender(options);
    auto result = toH5(options).toString;
    afterRender(options);
    return result;
  }
}
mixin(ViewComponentCalls!("ViewComponent", "DViewComponent"));

version(test_uim_mvc) { unittest {
  testViewComponent(ViewComponent, "ViewComponent");

  assert(ViewComponent.name == "ViewComponent");
  assert(ViewComponent.create.name == "ViewComponent");
  assert(ViewComponent.clone.name == "ViewComponent");
}} 

/*

module uim.mvc.views.components.component;

import uim.mvc;

@safe:
class DViewComponent : DAPPBaseView {
  mixin(ViewComponentThis!"ViewComponent");
  
  
override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize; 



/*     this
    .components.add(
      NullComponent.id("header"),
      NullComponent.id("content"),
      NullComponent.id("footer")
    ); *
    /
  }
/* 
  DViewComponent copy() {
    return
      clone
        .debugPrefix(this.debugPrefix) 
        .options(this.options)
        .dynamic(this.dynamic)
        .jsCode(this.jsCode)
        .style(this.style)
        .changed(this.changed)
        .view(this.view)
        .layout(this.layout); 
  } * /

  // #region h5 content 
    override void beforeH5(STRINGAA options = null) {
      debugMethodCall(moduleName!DViewComponent~":DViewComponent("~this.name~")::beforeH5");
      this.clearError; // Delete last error
      super.beforeH5(options);
      // init
    }

    DH5Obj[] toH5(STRINGAA options = null) {
      debugMethodCall(moduleName!DViewComponent~":DViewComponent("~this.name~")::toH5");
      beforeH5(options);
      DH5Obj[] preh5 = null;
      auto h5 = afterH5(preh5, options);
      return h5;        
    }
  // #endregion h5

  DH5Obj[] afterH5(DH5Obj[] h5, STRINGAA options = null) {
      debugMethodCall(moduleName!DViewComponent~":DViewComponent("~this.name~")::afterH5");
      return h5; // No changes 
    }

  // #region render
    /// Renders view
    /// Render triggers helper callbacks, which are fired before and after the template are rendered.
    /// The helper callbacks are called: `beforeRender`, `afterRender`
    void beforeRender(STRINGAA options = null) {
      debugMethodCall(debugPrefix~"beforeRender"); 
    }


    string afterRender(string content, STRINGAA options = null) {
      debugMethodCall(debugPrefix~"afterRender"); 
      return content; // No changes
    }

    string renderH5(STRINGAA options = null) {
      auto preRender = toH5(options).map!(a => a.toString).join;
      return preRender;
      // return layout ? layout.render(controller, preRender) : preRender;
    }

    string render(STRINGAA options = null) {
      debugMethodCall(debugPrefix~"render"); 
      beforeRender(options);
      if (hasError) { return null; }
      
      auto preRender = renderH5(options);
      if (hasError) { return null; }

      auto result = afterRender(preRender, options);
      if (hasError) { return null; }

      return result; }

    // #endregion render 
}
mixin(ViewComponentCalls!("ViewComponent"));

version(test_uim_apps) { unittest {
  assert(ViewComponent);
}}
*/