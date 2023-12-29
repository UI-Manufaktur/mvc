/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.controller;

import uim.mvc;

@safe:
class DController : DMVCObject, IController, IControllerComponentManager, ISessionManager  {
  mixin(ControllerThis!("Controller"));

  mixin(TProperty!("IControllerManager", "manager"));

  mixin SessionContainerTemplate;
  mixin SessionManagerTemplate; 

  mixin(TProperty!("IControllerComponent[]", "components"));
  mixin ControllerComponentManagerTemplate;

  mixin CheckManagerTemplate;

  // Set to true to automatically render the view after action logic.
  mixin(OProperty!("bool", "autoRender"));

  // Automatically set to the name of a plugin.
  mixin(OProperty!("string", "plugin"));

  // Initialization (= hook method)
  override void initialize(Json[string] configSettings = null) {
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

    components(null);
    _checks = null;
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
    mixin(MVCParameter!("viewName"));
    mixin(MVCParameter!("redirectUrl"));

  // #endregion Properties

  protected IEntityBase _entityBase;
  void entityBase(IEntityBase anEntityBase) {
    _entityBase = anEntityBase;
  }
  IEntityBase entityBase() {
    if (_entityBase) return _entityBase;

    return (manager ? manager.entityBase : null);
  }

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
  
  bool hasRedirect() {
    return (this.redirectUrl.length > 0);
  }
  
  Json message(STRINGAA options) {
    auto json = message(Json.emptyObject, options);
    return json;
  }

  Json message(Json json, STRINGAA options) {    
    if ("errors" !in json) json["errors"] = Json.emptyArray;
    if ("warnings" !in json) json["warnings"] = Json.emptyArray;
    if ("infos" !in json) json["infos"] = Json.emptyArray;
    if ("results" !in json) json["results"] = Json.emptyObject;

    return json;
  }

  auto requestParameters(STRINGAA defaultValues = null) {
    debugMethodCall(moduleName!DController~":DController("~this.name~")::requestParameters");
    STRINGAA result = defaultValues.dup; 
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

  // #region Response
    bool beforeResponse(STRINGAA options = null) { // Hook
      debugMethodCall(moduleName!DController~":DController("~this.name~")::beforeResponse");

      this.error = null;
      this.redirectUrl = null;

      debug writeln ("Execute Checks");
      foreach(myCheck; this.checks) {
        if (!myCheck.execute(options)) { // Has Error
          if (auto checkObj = cast(DControllerCheck)myCheck) { 
            if (auto myError = checkObj.error) {
              this.response.redirect("/error");
            }
            if (checkObj.redirectUrl || "redirect" in options) {
              /* this.exception = checkObj.exception; */
              auto myRedirectUrl = (checkObj.redirectUrl ? checkObj.redirectUrl : options.get("redirect", null));
              options.remove("redirect");
              this.response.redirect(myRedirectUrl);
            }
          }
          return false; // Strict - An error requires an error reaction or handling
        }
      }

      debug writeln ("Checks Successfully");
      return true;
    }    

    void afterResponse(STRINGAA options = null) { // Hook
      debugMethodCall(moduleName!DController~":DController::afterResponse");

      if (this.error) {
        this.response.redirect("/error");
      }

      if (auto myRedirectUrl = (redirectUrl ? redirectUrl : options.get("redirect", null))) {
        options.remove("redirect");
        this.response.redirect(myRedirectUrl);
      }
    }

    string stringResponse(STRINGAA options = null) { // Hook
      debugMethodCall(moduleName!DController~":DController::stringResponse");
      return "";
    }

    void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse) { // Required to link vibe.d router
      debugMethodCall(moduleName!DController~":DController("~this.name~")::request(req, res)");
    }

    void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, STRINGAA options) {
      debugMethodCall(moduleName!DController~":DController("~this.name~")::request(req, res, requestParameters)");

      this.request = newRequest; this.response = newResponse;
      options = requestParameters(options);

      debug writeln("Start Before Response");
      beforeResponse(options); // Hook

      auto result = stringResponse(options); // Hook, only if necessary

      debug writeln("Start AfterResponse");
      afterResponse(options); // Hook
      
      debug writeln("Back to vibe...");
      this.response.writeBody(result, this.mimetype); 
    }
  // #endregion Response
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

