public import uim.mvc.mixins.model;

@safe:
import uim.mvc;

class DMVCModel : IMVCModel { 
    this() { initialize; } 
    this(DMVCApplication myApplication) { this().application(myApplication); } 
    this(string myName) { this().name(myName); } 
    this(STRINGAA myOptions) { this().options(myOption); } 

    mixin(OProperty!("STRINGAA", "parameters"));
}
mixin(MVCModelCalls!("MVCModel", "DMVCModel"));

version(test_uim_mvc) { unitest { 
    assert(MVCModel);
}} 
