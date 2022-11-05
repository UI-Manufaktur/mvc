module uim.baklava.views.components.component;

@safe:
import uim.baklava;

class DBLVViewComponent : DBLVBase, IBLVViewComponent {
  mixin(BLVViewComponentThis!("BLVViewComponent"));

  override void initialize() {
    super.initialize;
  }

  mixin(OProperty!("IBLVView", "view"));
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
    debugMethodCall(moduleName!DBLVView~":DBLVView("~this.name~")::toH5");
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
mixin(BLVViewComponentCalls!("BLVViewComponent", "DBLVViewComponent"));

version(test_uim_mvc) { unittest {
  testBLVViewComponent(BLVViewComponent, "BLVViewComponent");

  assert(BLVViewComponent.name == "BLVViewComponent");
  assert(BLVViewComponent.create.name == "BLVViewComponent");
  assert(BLVViewComponent.clone.name == "BLVViewComponent");
}} 
