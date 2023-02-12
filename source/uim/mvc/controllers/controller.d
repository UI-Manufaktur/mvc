module uim.mvc.controllers.controller;

@safe:
import uim.mvc;

class DController : DMVCBase, IController  {
  mixin(ControllerThis!("Controller"));

  // Set to true to automatically render the view after action logic.
  mixin(OProperty!("bool", "autoRender"));

  // Instance of ComponentRegistry used to create Components
  mixin(OProperty!("ControllerComponentRegistry", "components"));

  // Automatically set to the name of a plugin.
  mixin(OProperty!("string", "plugin"));

  // Initialization (= hook method)
  override void initialize(DConfig configSetting = null) {
    debugMethodCall(moduleName!DController~"::DController("~this.name~"):initialize");   
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
      _defaultConfig = Json.emptyObject;
      _defaultConfig["key"] = "Auth.User";
      _defaultConfig["redirect"] = "Auth.redirect";

      _config = Json.emptyObject;

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
    mixin(MVCParameter!("form"));
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

  /* mixin(OProperty!("DMVCCheck[]", "checks"));
  O addChecks(this O)(DMVCCheck[] newChecks) {
    this.checks(this.checks~newChecks);
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
  mixin(OProperty!("DEntity", "session"));

  // Configuration of controller
  mixin(OProperty!("Json", "defaultConfig"));
  mixin(OProperty!("Json", "config"));

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
      .form(this.request.form.toString)
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
		debugMethodCall(moduleName!DController~":DController("~this.name~")::request(req, res, reqParameters)");

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

version(test_uim_mvc) { unittest {
  testController(Controller, "Controller");

  assert(Controller.name == "Controller");
  assert(Controller.create.name == "Controller");
  assert(Controller.clone.name == "Controller");
}} 


