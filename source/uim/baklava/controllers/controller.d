module uim.baklava.controllers.controller;

@safe:
import uim.baklava;

class DBKLController : DBKLBase, IBKLController  {
  mixin(BKLControllerThis!("BKLController"));

  // Initialization (= hook method)
  override void initialize() {
    debugMethodCall(moduleName!DBKLController~"::DBKLController("~this.name~"):initialize");   
    super.initialize;

    this
      .name("BKLController"); 
  }
  
  mixin(BKLParameter!("mimetype")); 
  mixin(BKLParameter!("rootPath")); 
  mixin(BKLParameter!("collectionName"));
  mixin(BKLParameter!("entitiesName")); 
	mixin(BKLParameter!("language"));
  mixin(BKLParameter!("responseResult"));

  mixin(BKLParameter!("httpMode"));
  mixin(BKLParameter!("stringRequest"));
  mixin(BKLParameter!("method"));
  mixin(BKLParameter!("form"));
  mixin(BKLParameter!("peer"));
  mixin(BKLParameter!("host"));
  mixin(BKLParameter!("path"));
  mixin(BKLParameter!("rootDir"));
  mixin(BKLParameter!("queryString"));
  mixin(BKLParameter!("fullURL"));
  mixin(BKLParameter!("json"));
  mixin(BKLParameter!("username"));
  mixin(BKLParameter!("password"));
  mixin(BKLParameter!("contentType"));
  mixin(BKLParameter!("contentTypeParameters"));
  mixin(BKLParameter!("timeCreated"));
  mixin(BKLParameter!("persistent"));
  mixin(BKLParameter!("redirect"));

  /* mixin(OProperty!("DBKLCheck[]", "checks"));
  O addChecks(this O)(DBKLCheck[] newChecks) {
    this.checks(this.checks~newChecks);
    return cast(O)this;
  } */

  HTTPServerRequest _request;
  HTTPServerRequest request() { return _request; }
  void request(HTTPServerRequest newRequest) { _request = newRequest; }

  HTTPServerResponse _response;
  HTTPServerResponse response() { return _response; }
  void response(HTTPServerResponse newResponse) { _response = newResponse; }

  mixin(OProperty!("DOOPEntity", "session"));

  /// Configuration of controller
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
    debugMethodCall(moduleName!DBKLController~":DBKLController("~this.name~")::beforeResponse");
  }    

  void afterResponse(string[string] options = null) {
    debugMethodCall(moduleName!DBKLController~":DBKLController::afterResponse");
  }

  string stringResponse(string[string] options = null) {
    debugMethodCall(moduleName!DBKLController~":DBKLController::stringResponse");
    return "";
  }

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse) {
		debugMethodCall(moduleName!DBKLController~":DBKLController("~this.name~")::request(req, res)");
  }

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, STRINGAA options) {
		debugMethodCall(moduleName!DBKLController~":DBKLController("~this.name~")::request(req, res, reqParameters)");

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
mixin(BKLControllerCalls!("BKLController", "DBKLController"));

version(test_uim_mvc) { unittest {
  testBKLController(BKLController, "BKLController");

  assert(BKLController.name == "BKLController");
  assert(BKLController.create.name == "BKLController");
  assert(BKLController.clone.name == "BKLController");
}} 


