module uim.mvc.views.components.component;

@safe:
import uim.mvc;

class DViewComponent : DMVCObject, IViewComponent {
  mixin(ViewComponentThis!("ViewComponent"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .id(this.name)
    .changed(true)
    .dynamic(true)
    .notNull(true);
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
mixin(ViewComponentCalls!("ViewComponent", "DViewComponent"));

version(test_uim_mvc) { unittest {
  testViewComponent(ViewComponent, "ViewComponent");

  assert(ViewComponent.name == "ViewComponent");
  assert(ViewComponent.create.name == "ViewComponent");
  assert(ViewComponent.clone.name == "ViewComponent");
}} 
