module uim.baklava.views.view;

@safe:
import uim.baklava;

class DBLVView : DBLVBase, IBLVView { 
  mixin(BLVViewThis!("BLVView"));

  override void initialize() {
    super.initialize;
  }
  
  mixin(OProperty!("IBLVController", "controller"));  
  mixin(OProperty!("DOOPEntity", "entity"));
  mixin(OProperty!("DOOPEntity[]", "entities"));
  mixin(OProperty!("string", "rootPath"));

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
mixin(BLVViewCalls!("BLVView", "DBLVView"));

version(test_uim_mvc) { unittest { 
  testBLVView(BLVView, "BLVView");

  assert(BLVView.name == "BLVView");
  assert(BLVView.create.name == "BLVView");
  assert(BLVView.clone.name == "BLVView");
}} 
