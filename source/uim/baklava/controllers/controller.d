module uim.baklava.controllers.controller;

@safe:
import uim.baklava;

class DBLVController : DBLVBase, IBLVController  {
  mixin(BLVControllerThis!("BLVController"));

  // Initialization (= hook method)
  override void initialize() {
    debugMethodCall(moduleName!DBLVController~"::DBLVController("~this.name~"):initialize");   
    super.initialize;

    this
      .name("BLVController"); 
  }
  
  mixin(BLVParameter!("mimetype")); 
  mixin(BLVParameter!("rootPath")); 
  mixin(BLVParameter!("collectionName"));
  mixin(BLVParameter!("entitiesName")); 
	mixin(BLVParameter!("language"));
  mixin(BLVParameter!("responseResult"));

  mixin(BLVParameter!("httpMode"));
  mixin(BLVParameter!("stringRequest"));
  mixin(BLVParameter!("method"));
  mixin(BLVParameter!("form"));
  mixin(BLVParameter!("peer"));
  mixin(BLVParameter!("host"));
  mixin(BLVParameter!("path"));
  mixin(BLVParameter!("rootDir"));
  mixin(BLVParameter!("queryString"));
  mixin(BLVParameter!("fullURL"));
  mixin(BLVParameter!("json"));
  mixin(BLVParameter!("username"));
  mixin(BLVParameter!("password"));
  mixin(BLVParameter!("contentType"));
  mixin(BLVParameter!("contentTypeParameters"));
  mixin(BLVParameter!("timeCreated"));
  mixin(BLVParameter!("persistent"));
  mixin(BLVParameter!("redirect"));

  /* mixin(OProperty!("DBLVCheck[]", "checks"));
  O addChecks(this O)(DBLVCheck[] newChecks) {
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
    debugMethodCall(moduleName!DBLVController~":DBLVController("~this.name~")::beforeResponse");
  }    

  void afterResponse(string[string] options = null) {
    debugMethodCall(moduleName!DBLVController~":DBLVController::afterResponse");
  }

  string stringResponse(string[string] options = null) {
    debugMethodCall(moduleName!DBLVController~":DBLVController::stringResponse");
    return "";
  }

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse) {
		debugMethodCall(moduleName!DBLVController~":DBLVController("~this.name~")::request(req, res)");
  }

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, STRINGAA options) {
		debugMethodCall(moduleName!DBLVController~":DBLVController("~this.name~")::request(req, res, reqParameters)");

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
mixin(BLVControllerCalls!("BLVController", "DBLVController"));

version(test_uim_mvc) { unittest {
  testBLVController(BLVController, "BLVController");

  assert(BLVController.name == "BLVController");
  assert(BLVController.create.name == "BLVController");
  assert(BLVController.clone.name == "BLVController");
}} 


