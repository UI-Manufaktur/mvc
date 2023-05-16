/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.controller;

import uim.mvc;
@safe:

class DController : DMVCObject, IController  {
  mixin(ControllerThis!("Controller"));

  // Set to true to automatically render the view after action logic.
  mixin(OProperty!("bool", "autoRender"));

  // Instance of ComponentRegistry used to create Components
  mixin(OProperty!("DControllerComponentRegistry", "components"));

  // Automatically set to the name of a plugin.
  mixin(OProperty!("string", "plugin"));

  // Initialization (= hook method)
  override void initialize(Json configSettings = Json(null)) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DController~"::DController("~this.className~"):initialize"); }  
    super.initialize(configSettings);

    _autoRender = true;

    /**
      * Default configuration for this class.
      *
      * Keys:
      * - key: Session key used to store user record.
      * - redirect: Session key used to store redirect URL.
      *
      */
      _defaultConfig["key"] = "Auth.User";
      _defaultConfig["redirect"] = "Auth.redirect";

    this
      .name("Controller"); 
  }
  
  // #region Properties
    mixin(MVCParameter!("mimetype")); 
    mixin(MVCParameter!("rootPath")); 
    mixin(MVCParameter!("collectionName"));
    mixin(MVCParameter!("entitiesName")); 
    mixin(MVCParameter!("language"));
    mixin(MVCParameter!("responseResult"));

    mixin(MVCParameter!("httpMode"));
    mixin(MVCParameter!("stringRequest"));
    mixin(MVCParameter!("method"));
    /* mixin(MVCParameter!("form")); */
    mixin(MVCParameter!("peer"));
    mixin(MVCParameter!("host"));
    mixin(MVCParameter!("path"));
    mixin(MVCParameter!("rootDir"));
    mixin(MVCParameter!("queryString"));
    mixin(MVCParameter!("fullURL"));
    mixin(MVCParameter!("json"));
    mixin(MVCParameter!("username"));
    mixin(MVCParameter!("password"));
    mixin(MVCParameter!("contentType"));
    mixin(MVCParameter!("contentTypeParameters"));
    mixin(MVCParameter!("timeCreated"));
    mixin(MVCParameter!("persistent"));
    mixin(MVCParameter!("redirect"));
  // #endregion Properties

  /// Owning controller
  // mixin(OProperty!("IApplication", "app"));
  mixin(OProperty!("DController", "controller"));

  mixin(OProperty!("DControllerCheck[]", "checks"));
  O addChecks(this O)(DControllerCheck[] newChecks) {
    this.checks(this.checks~newChecks);
    return cast(O)this;
  } 


/*   // controller components
  mixin(OProperty!("DBaseController[string]", "components")); 
  bool hasComponent(string key) {
    return (this.component(key) !is null);
  }
  DBaseController component(string key) {
    return this.components.get(key, null);
  }
  O component(this O)(string key, DBaseController newComponent) {
    components[key] = newComponent;
    return cast(O)this;
  } */

  // #region HTTPServerRequest _request
    /**
      * An instance of a HTTPServerRequest object that contains information about the current request.
      * This object contains all the information about a request and several methods for reading
      * additional information about the request.
      * @link https://vibed.org/api/vibe.http.server/HTTPServerRequest
      */
    HTTPServerRequest _request;
    HTTPServerRequest request() { return _request; }
    void request(HTTPServerRequest newRequest) { _request = newRequest; }
  // #region HTTPServerRequest _request

  // #region HTTPServerResponse response
    /**
     * An instance of a Response object that contains information about the impending response
     *
     * @link https://vibed.org/api/vibe.http.server/HTTPServerResponse
     */
    HTTPServerResponse _response;
    HTTPServerResponse response() { return _response; }
    void response(HTTPServerResponse newResponse) { _response = newResponse; }
  // #endregion HTTPServerResponse response

  // https://vibed.org/api/vibe.http.session/
  mixin(OProperty!("DMVCSession", "session"));

  // #region database
    DETBBase _database; 
    O database(this O)(DETBBase aDatabase) { 
      _database = aDatabase; 
      return cast(O)this; }

    DETBBase database() {
      if (_database) { return _database; } // has his own database
      if (this.controller && this.controller.database) { return this.controller.database; } // owner has database
      // if (auto myApp = cast(IApplication)app) { return myApp.database; } // Leading app has database
      return null; // no database found
    }
  // #endregion database
  
  bool hasRedirect() {
    return (this.redirect.length > 0);
  }
  
  Json message(string[string] options) {
    auto json = message(Json.emptyObject, options);
    return json;
  }

  Json message(Json json, string[string] options) {    
    if ("errors" !in json) json["errors"] = Json.emptyArray;
    if ("warnings" !in json) json["warnings"] = Json.emptyArray;
    if ("infos" !in json) json["infos"] = Json.emptyArray;
    if ("results" !in json) json["results"] = Json.emptyObject;

    return json;
  }

  auto requestParameters(string[string] defaultValues = null) {
    string[string] result = defaultValues.dup; 
    this
      .httpMode((this.request.fullURL.toString.indexOf("https") == 0 ? "https" : "http"))
      .stringRequest(this.request.toString)
      .method(to!string(this.request.method))
      /* .form(this.request.form.toString) */
      .peer(this.request.peer)
      .host(this.request.host)
      .path(this.request.path)
      .rootDir(this.request.rootDir)
      .queryString(this.request.queryString)
      .fullURL(this.request.fullURL.toString)
      .json(this.request.json.toString)
      .username(this.request.username)
      .password(this.request.password)
      .contentType(this.request.contentType)
      .contentTypeParameters(this.request.contentTypeParameters)
      .timeCreated(to!string(toTimestamp(this.request.timeCreated)))
      .persistent(to!string(this.request.persistent));
    
    foreach(key; this.request.params.byKey) result[key] = this.request.params.getAll(key).map!(k => to!string(k)).join(",");
    foreach(key; this.request.headers.byKey) result[key] = this.request.headers.getAll(key).map!(k => to!string(k)).join(",");
    foreach(key; this.request.query.byKey) result[key] = this.request.query.getAll(key).map!(k => to!string(k)).join(",");
    foreach(key; this.request.form.byKey) result[key] = this.request.form.getAll(key).map!(k => to!string(k)).join(",");

    readSessionId(this.request, result);
    return result;
  }

  void beforeResponse(string[string] options = null) {
    debugMethodCall(moduleName!DController~":DController("~this.name~")::beforeResponse");
  }    

  void afterResponse(string[string] options = null) {
    debugMethodCall(moduleName!DController~":DController::afterResponse");
  }

  string stringResponse(string[string] options = null) {
    debugMethodCall(moduleName!DController~":DController::stringResponse");
    return "";
  }

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse) {
		debugMethodCall(moduleName!DController~":DController("~this.name~")::request(req, res)");
  }

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, STRINGAA options) {
		debugMethodCall(moduleName!DController~":DController("~this.name~")::request(req, res, requestParameters)");

		this.request = newRequest; this.response = newResponse;
    options = requestParameters(options);
		beforeResponse(options);

    if (hasError) {
      debug writeln("Found error -> ", this.error);
      options["redirect"] = "/error";
    }

		if ("redirect" in options) {
      debug writeln("Found redirect to ", options["redirect"]);
      auto redirect = options["redirect"]; 
      options.remove("redirect");
      newResponse.redirect(redirect);
    } 

    auto result = stringResponse(options);
    afterResponse(options);
    
		this.response.writeBody(result, this.mimetype); 
  }
}
mixin(ControllerCalls!("Controller", "DController"));

///
unittest {
  testController(Controller, "Controller");

  assert(Controller.name == "Controller");
  assert(Controller.create.name == "Controller");
  assert(Controller.clone.name == "Controller");

  assert(Controller.defaultConfig["key"] == "Auth.User");
  assert(Controller.defaultConfig["redirect"] == "Auth.redirect");
}

template ControllerProperty(string dataType, string name) {
  const char[] ControllerProperty = `
  `~dataType~` `~name~`() { return cast(`~dataType~`)this.component("`~name~`"); }
  O `~name~`(this O)(`~dataType~` newComponent) { this.component("`~name~`", newComponent); return cast(O)this; }
  `;
}
