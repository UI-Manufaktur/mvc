public import uim.mvc.mixins.model;

class DMVCModel : IMVCModel { 
    this() { initialize; } 
    this(DMVCApplication myApplication) { this().application(myApplication); } 
    this(string myName) { this().name(myName); } 
    this(STRINGAA myOptions) { this().options(myOption); } 
}
