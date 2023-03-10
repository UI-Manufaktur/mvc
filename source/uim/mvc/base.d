module uim.mvc.base;

@safe:
import uim.mvc;

interface IMVCObject {
  DMVCApplication application();
  O application(this O)(DMVCApplication newApplication);

  string name();
  O name(this O)(string newName);

  O fromJson(this O)(Json values);
  Json toJson();
}

class DMVCObject : IMVCObject {
  // Constructors for the main properties
  this() { initialize; }
  this(DConfigurationValue configSettings) { this().initialize(configSettings); }
  this(DMVCApplication newApplication, Json configSettings = Json(null)) { this(configSettings).application(newApplication); }
  this(string newName, Json configSettings = Json(null)) { this(configSettings).name(newName); }
  this(string[string] newParameters, Json configSettings = Json(null)) { this(configSettings).parameters(newParameters); }
  this(DMVCApplication newApplication, string newName, Json configSettings = Json(null)) { this(newApplication).name(newName); }
  this(DMVCApplication newApplication, string[string] newParameters, Json configSettings = Json(null)) { this(newApplication,configSettings).parameters(newParameters); }
  this(string newName, string[string] newParameters, Json configSettings = Json(null)) { this(newName, configSettings).parameters(newParameters); }
  this(DMVCApplication newApplication, string newName, string[string] newParameters, Json configSettings = Json(null)) { this(newApplication, newName, configSettings).parameters(newParameters); }

  void initialize(Json configSettings = Json(null)) {
    // Code for object initialization
    this
      .name("MVCObject")
      .defaultConfig(ConfigurationValue)
      .config(ConfigurationValue);
  }

  mixin(OProperty!("DMVCApplication", "application"));

  // The name of a mvc object. Names are plural, named after the model they manipulate.
  mixin(MVCParameter!("name"));

  /**
    * Default config
    * These are merged with user-provided config when the component is used.
    */
  mixin(OProperty!("DConfigurationValue", "defaultConfig"));

  // Configuration of mvcobject
  mixin(OProperty!("DConfigurationValue", "config"));

  // #region Parameters
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
  // #endregion Parameters

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

  DMVCObject create() {
    return MVCObject;
  }

  DMVCObject clone() {
    DMVCObject result = create;
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
auto MVCObject() { return new DMVCObject; }

version(test_uim_mvc) unittest {
  assert(MVCObject);
  assert(MVCObject.name("testName").name == "testName");

  assert(MVCObject.parameter("test", "value").hasParameter("test"));
  assert(MVCObject.parameter("test", "value").parameter("test") == "value");

  auto json = Json.emptyObject;
  json["test"] = "value";
  assert(MVCObject.fromJson(json).hasParameter("test"));
  assert(MVCObject.fromJson(json).parameter("test") == "value");
  
  assert(MVCObject.create.name == "MVCObject");
  assert(MVCObject.clone.name == "MVCObject");
}