module uim.baklava.views.view;

@safe:
import uim.baklava;

class DBKLView : DBKLBase, IBKLView { 
  mixin(BKLViewThis!("BKLView"));

  override void initialize() {
    super.initialize;
  }
  
  mixin(OProperty!("IBKLController", "controller"));  
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
mixin(BKLViewCalls!("BKLView", "DBKLView"));

version(test_uim_mvc) { unittest { 
  testBKLView(BKLView, "BKLView");

  assert(BKLView.name == "BKLView");
  assert(BKLView.create.name == "BKLView");
  assert(BKLView.clone.name == "BKLView");
}} 
