/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.base;

import uim.mvc;

@safe:
class DMVCObject : IMVCObject, IRegisterable {
  // Constructors for the main properties
  this() { initialize; }
  this(Json configSettings) { this().initialize(configSettings); }
  this(IApplication newApplication, Json configSettings = Json(null)) { this(configSettings).application(newApplication); }
  this(string newName, Json configSettings = Json(null)) { this(configSettings).name(newName); }
  this(string[string] newParameters, Json configSettings = Json(null)) { this(configSettings).parameters(newParameters); }
  this(IApplication newApplication, string newName, Json configSettings = Json(null)) { this(newApplication).name(newName); }
  this(IApplication newApplication, string[string] newParameters, Json configSettings = Json(null)) { this(newApplication,configSettings).parameters(newParameters); }
  this(string newName, string[string] newParameters, Json configSettings = Json(null)) { this(newName, configSettings).parameters(newParameters); }
  this(IApplication newApplication, string newName, string[string] newParameters, Json configSettings = Json(null)) { this(newApplication, newName, configSettings).parameters(newParameters); }

  void initialize(Json configSettings = Json(null)) {
    // Code for object initialization
    this
      .name("MVCObject");
    
    this
      .defaultConfig(Json.emptyObject)
      .config(Json.emptyObject);
  }

  mixin(OProperty!("IApplication", "application"));

  // The name of a mvc object. Names are plural, named after the model they manipulate.
  mixin(OProperty!("string", "name"));
  mixin(OProperty!("string", "className"));
  mixin(OProperty!("string", "registerPath"));

/*   string opIndex(string aValue) {
    switch(aKey) {
      case "name": return name(); break;
      default: return null;
    }
  }

  void opIndexAssign(string aValue, string aKey) {
    switch(aKey) {
      case "name": name(aValue); break;
      default: return;
    }
  } */

  /**
    * Default config
    * These are merged with user-provided config when the component is used.
    */
  mixin(OProperty!("Json", "defaultConfig"));

  // Configuration of mvcobject
  mixin(OProperty!("Json", "config"));

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

    string get(string aKey) { return this[aKey]; }
    string opIndex(string key) {
      switch(key) { 
        default: return this.parameter(key);
      }
    }

    void set(string aKey, string aValue) { this[aKey] = aValue; }
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

  string debugInfo() {
    return "";
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

/*
module uim.mvc.object_;

import uim.mvc;

@safe:
class DAPPObject {
  this() {
    this.name = "APPObject";
    initialize();
  }

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings); 
  }
  
  mixin(APPParameter!("id")); 
  mixin(APPParameter!("name")); 

  /// Additional parameters
  mixin(OProperty!("STRINGAA", "parameters")); 
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
      case "error": return error;
      default: return this.parameter(key);
    }
  }
  void opIndexAssign(string newValue, string key) {
    this.parameter(key, newValue);
  }

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
  
  O create(this O)() {
    return new O;
  }

  O clone(this O)() {
    O obj = create;
    return obj;
  }
}
auto APPObject() { return new DAPPObject; }

version(test_uim_apps) { unittest {
  assert(new DAPPObject);

  assert(APPObject);
  assert(APPObject.id == "");
  assert(APPObject.id("object").id == "object");
  assert(APPObject.name == "APPObject");
  assert(APPObject.name("object").name == "object");
}}
*/