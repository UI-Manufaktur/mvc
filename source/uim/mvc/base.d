module uim.mvc.base;

@safe:
import uim.mvc;

interface IMVCBase {
  string name();
  O name(this O)(string newName);
}

class DMVCBase : IMVCBase {
  // Constructors for the main properties
  this() { initialize; }
  this(DMVCApplication newApplication) { this().application(newApplication); }
  this(string newName) { this().name(newName); }
  this(string[string] newParameters) { this().parameters(newParameters); }
  this(DMVCApplication newApplication, string newName) { this(newApplication).name(newName); }
  this(DMVCApplication newApplication, string[string] newParameters) { this(newApplication).parameters(newParameters); }
  this(string newName, string[string] newParameters) { this(newName).parameters(newParameters); }
  this(DMVCApplication newApplication, string newName, string[string] newParameters) { this(newApplication, newName).parameters(newParameters); }

  void initialize() {
    // Code for object initialization
  }

  mixin(OProperty!("DMVCApplication", "application"));
  mixin(OProperty!("string", "name"));

// Start Parameters ----
  mixin(OProperty!("string[string]", "parameters")); 
  bool hasParameter(string key) {
    return key in _parameters ? true : false;
  }
  string parameter(string key) {
    return _parameters.get(key, null);
  }
  O parameter(this O)(string key, string newValue) {
    _parameters[key] = newValue;
    return cast(O)this;
  }

  string opIndex(string key) {
    switch(key) { 
      default: return this.parameter(key);
    }
  }
  void opIndexAssign(string newValue, string key) {
    this.parameter(key, newValue);
  }
// End Parameters ----

  O create(this O)() {
    return new O;
  }

  O clone(this O)() {
    O obj = create;
    return obj;
  }
}