module uim.mvc.views.view;

@safe:
import uim.mvc;

class DMVCView : DMVCBase, IMVCView { 
  this() { super(); initialize; } 
  this(DMVCApplication myApplication) { this().application(myApplication); } 
  this(string myName) { this().name(myName); } 
  this(string[string] myParameters) { this().parameters(myParameters); } 

  this(DMVCApplication myApplication, string myName) { this(myApplication).name(myName); } 
  this(DMVCApplication myApplication, string[string] myParameters) { this(myApplication).parameters(myParameters); } 
  this(DMVCApplication myApplication, string myName, string[string] myParameters) { this(myApplication, myName).parameters(myParameters); } 

  this(string myName, string[string] myParameters) { this(myName).parameters(myParameters); } 

  override void initialize() {}
  
}
mixin(MVCViewCalls!("MVCView", "DMVCView"));

version(test_uim_mvc) { unittest { 
  testMVCView(MVCView, "MVCView");
}} 
