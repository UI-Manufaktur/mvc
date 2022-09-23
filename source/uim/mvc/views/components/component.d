module uim.mvc.views.components.component;

@safe:
import uim.mvc;

class DMVCViewComponent : DMVCBase, IMVCViewComponent {
  mixin(MVCViewComponentThis!("MVCViewComponent"));

  override void initialize() {
    super.initialize;
  }

  mixin(OProperty!("IMVCView", "view"));

  void beforeH5(STRINGAA options = null) {
    // 
  }

  void afterH5(STRINGAA options = null) {
    // 
  }

  DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCView~":DMVCView("~this.name~")::toH5");
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
mixin(MVCViewComponentCalls!("MVCViewComponent", "DMVCViewComponent"));

version(test_uim_mvc) { unittest {
  testMVCViewComponent(MVCViewComponent, "MVCViewComponent");

  assert(MVCViewComponent.name == "MVCViewComponent");
  assert(MVCViewComponent.create.name == "MVCViewComponent");
  assert(MVCViewComponent.clone.name == "MVCViewComponent");
}} 
