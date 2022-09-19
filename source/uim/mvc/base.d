module uim.mvc.base;

@safe:
import uim.mvc;

class DMVCBase {
  this() {}

  void initialize() {
    // Code for initialization of new objects
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