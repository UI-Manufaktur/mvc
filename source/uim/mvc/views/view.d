/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.view;

@safe:
import uim.mvc;

class DMVCView : DMVCBase, IMVCView { 
  mixin(MVCViewThis!("MVCView"));

  override void initialize() {
    super.initialize;
  }
  
  mixin(OProperty!("IController", "controller"));  
  mixin(OProperty!("DEntity", "entity"));
  mixin(OProperty!("DEntity[]", "entities"));
  mixin(OProperty!("string", "rootPath"));

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
mixin(MVCViewCalls!("MVCView", "DMVCView"));

version(test_uim_mvc) { unittest { 
  testMVCView(MVCView, "MVCView");

  assert(MVCView.name == "MVCView");
  assert(MVCView.create.name == "MVCView");
  assert(MVCView.clone.name == "MVCView");
}} 
