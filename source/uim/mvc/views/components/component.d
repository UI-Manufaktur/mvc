module uim.baklava.views.components.component;

@safe:
import uim.baklava;

class DBKLViewComponent : DBKLBase, IBKLViewComponent {
  mixin(BKLViewComponentThis!("BKLViewComponent"));

  override void initialize() {
    super.initialize;
  }

  mixin(OProperty!("IBKLView", "view"));
  mixin(OProperty!("string", "id"));

  mixin(OProperty!("DOOPEntity", "entity"));
  mixin(OProperty!("DOOPEntity[]", "entities"));

  void beforeH5(STRINGAA options = null) {
    // 
  }

  void afterH5(STRINGAA options = null) {
    // 
  }

  DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DBKLView~":DBKLView("~this.name~")::toH5");
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
mixin(BKLViewComponentCalls!("BKLViewComponent", "DBKLViewComponent"));

version(test_uim_mvc) { unittest {
  testBKLViewComponent(BKLViewComponent, "BKLViewComponent");

  assert(BKLViewComponent.name == "BKLViewComponent");
  assert(BKLViewComponent.create.name == "BKLViewComponent");
  assert(BKLViewComponent.clone.name == "BKLViewComponent");
}} 
