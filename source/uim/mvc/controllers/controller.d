module uim.mvc.controllers.controller;

@safe:
import uim.mvc;

class DMVCController : DMVCBase, IMVCController  {
  mixin(MVCControllerThis!("MVCController"));

  // Initialization (= hook method)
  override void initialize() {
    debugMethodCall(moduleName!DMVCController~"::DMVCController("~this.name~"):initialize");   
    super.initialize;

    this
      .name("MVCController"); 
  }
  
  mixin(MVCParameter!("mimetype")); 
  mixin(MVCParameter!("rootPath")); 
  mixin(MVCParameter!("collectionName"));
  mixin(MVCParameter!("entitiesName")); 
	mixin(MVCParameter!("language"));
  mixin(MVCParameter!("responseResult"));

  mixin(MVCParameter!("httpMode"));
  mixin(MVCParameter!("requestCall"));
  mixin(MVCParameter!("method"));
  mixin(MVCParameter!("form"));
  mixin(MVCParameter!("peer"));
  mixin(MVCParameter!("host"));
  mixin(MVCParameter!("path"));
  mixin(MVCParameter!("queryString"));
  mixin(MVCParameter!("fullURL"));
  mixin(MVCParameter!("json"));
  mixin(MVCParameter!("username"));
  mixin(MVCParameter!("password"));
  mixin(MVCParameter!("contentType"));
  mixin(MVCParameter!("contentTypeParameters"));
  mixin(MVCParameter!("timeCreated"));
  mixin(MVCParameter!("persistent"));

  mixin(OProperty!("DAPPCheck[]", "checks"));
  O addChecks(this O)(DAPPCheck[] newChecks) {
    this.checks(this.checks~newChecks);
    return cast(O)this;
  }

  HTTPServerRequest _request;
  HTTPServerRequest request() { return _request; }
  void request(HTTPServerRequest newRequest) { _request = newRequest; }

  HTTPServerResponse _response;
  HTTPServerResponse response() { return _response; }
  void response(HTTPServerResponse newResponse) { _response = newResponse; }

  mixin(OProperty!("DOOPEntity", "session"));

  /// Configuration of controller
  mixin(OProperty!("Json", "config"));

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
    result["httpMode"] = (this.request.fullURL.toString.indexOf("https") == 0 ? "https" : "http");
    result["request"] = this.request.toString;
    result["method"] = to!string(this.request.method);
    result["form"] = this.request.form.toString;
    result["peer"] = this.request.peer;
    result["host"] = this.request.host;
    result["path"] = this.request.path;
    result["rootDir"] = this.request.rootDir;
    result["queryString"] = this.request.queryString;
    result["fullURL"] = this.request.fullURL.toString;
    result["json"] = this.request.json.toString;
    result["username"] = this.request.username;
    result["password"] = this.request.password;
    result["contentType"] = this.request.contentType;
    result["contentTypeParameters"] = this.request.contentTypeParameters;
    result["timeCreated"] = to!string(toTimestamp(this.request.timeCreated));
    result["persistent"] = to!string(this.request.persistent);
    
    foreach(key; this.request.params.byKey) result[key] = this.request.params.getAll(key).map!(k => to!string(k)).join(",");
    foreach(key; this.request.headers.byKey) result[key] = this.request.headers.getAll(key).map!(k => to!string(k)).join(",");
    foreach(key; this.request.query.byKey) result[key] = this.request.query.getAll(key).map!(k => to!string(k)).join(",");
    foreach(key; this.request.form.byKey) result[key] = this.request.form.getAll(key).map!(k => to!string(k)).join(",");

    readSessionId(this.request, result);
    return result;
  }

  void beforeResponse(string[string] options = null) {
    debugMethodCall(moduleName!DMVCController~":DMVCController("~this.name~")::beforeResponse");
  }    

  void afterResponse(string[string] options = null) {
    debugMethodCall(moduleName!DMVCController~":DMVCController::afterResponse");
  }

  string stringResponse(string[string] options = null) {
    debugMethodCall(moduleName!DMVCController~":DMVCController::stringResponse");
    return "";
  }

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, string[string] options = null) {
		debugMethodCall(moduleName!DMVCController~":DMVCController("~this.name~")::request(req, res, reqParameters)");

void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, STRINGAA options = null) {
		debugMethodCall(moduleName!DAPPController~":DAPPController("~this.name~")::request(req, res, reqParameters)");

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
    
		this.response.writeBody(result, this.mimetype); }
  }
}
mixin(MVCControllerCalls!("MVCController", "DMVCController"));

version(test_uim_apps) { unittest {
  testMVCController(MVCController, "MVCController");
}}

