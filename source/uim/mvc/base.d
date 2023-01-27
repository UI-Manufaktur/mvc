module uim.mvc.base;

@safe:
import uim.mvc;

interface IMVCBase {
  DMVCApplication application();
  O application(this O)(DMVCApplication newApplication);

  string name();
  O name(this O)(string newName);

  O fromJson(this O)(Json values);
  Json toJson();
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
    this
      .name("MVCBase");
  }

  mixin(OProperty!("DMVCApplication", "application"));

  // The name of a mvc object. Names are plural, named after the model they manipulate.
  mixin(MVCParameter!("name"));

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

// #region error handling
    string _error;
    string error() { return _error; }
    O error(this O)(string newError) {
      debug writeln("New Error:", newError);
      _error = newError;
      return cast(O)this;
    }

    bool hasError() { return (this.error.length > 0); } 
    O clearError(this O)() {
      _error = null;
      return cast(O)this;
    }
  // #endregion error

  DMVCBase create() {
    return MVCBase;
  }

  DMVCBase clone() {
    DMVCBase result = create;
    result.application(this.application);
    return result.fromJson(this.toJson);
  }

  O fromJson(this O)(Json values) {
    if (values != Json(null)) {
    
      foreach (keyvalue; values.byKeyValue) {
        this.parameter(
          keyvalue.key,
          keyvalue.value.get!string
        );
      }
    }
      
    return cast(O)this;
  }

  Json toJson() {
    Json result = Json.emptyObject;

    foreach(k, v; this.parameters) {
      result[k] = v;
    }

    return result;
  }

  override string toString() {
    return toJson.toString;
  }
}
auto MVCBase() { return new DMVCBase; }

version(test_uim_mvc) unittest {
  assert(MVCBase);
  assert(MVCBase.name("testName").name == "testName");

  assert(MVCBase.parameter("test", "value").hasParameter("test"));
  assert(MVCBase.parameter("test", "value").parameter("test") == "value");

  auto json = Json.emptyObject;
  json["test"] = "value";
  assert(MVCBase.fromJson(json).hasParameter("test"));
  assert(MVCBase.fromJson(json).parameter("test") == "value");
  
  assert(MVCBase.create.name == "MVCBase");
  assert(MVCBase.clone.name == "MVCBase");
}