module uim.mvc.views.components.component;

@safe:
import uim.mvc;

class DViewComponent : DMVCObject, IViewComponent {
  mixin(ViewComponentThis!("ViewComponent"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
  }

  mixin(OProperty!("IView", "view"));
  mixin(OProperty!("string", "id"));

  mixin(OProperty!("DEntity", "entity"));
  mixin(OProperty!("DEntity[]", "entities"));

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
