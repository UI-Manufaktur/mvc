module uim.mvc.models;

@safe:
import uim.mvc;

class DMVCModel : IMVCModel { 
  this() { initialize; } 
  this(DMVCApplication myApplication) { this().application(myApplication); } 
  this(string myName) { this().name(myName); } 
  this(STRINGAA myOptions) { this().options(myOption); } 

  this(DMVCApplication myApplication, string myName) { this(myApplication).name(myName); } 
  this(DMVCApplication myApplication, STRINGAA myOptions) { this(myApplication).options(myOption); } 
  this(DMVCApplication myApplication, string myName, STRINGAA myOptions) { this(myApplication, myName).options(myOption); } 

  this(string myName, STRINGAA myOptions) { this(myName).options(myOption); } 

  mixin(OProperty!("STRINGAA", "parameters"));

  void initialize() {}
}
mixin(MVCModelCalls!("MVCModel", "DMVCModel"));

version(test_uim_mvc) { unitest { 
  assert(MVCModel);
}} 
