/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.page;

import uim.mvc;
@safe:

class DPageController : DController, IPageController {
  mixin(ControllerThis!("PageController"));

  // Initialization (= hook method)
  override void initialize(Json configSettings = Json(null)) {
    version(test_uim_mvc) { 
      debugMethodCall(moduleName!DPageController~"::DPageController("~this.className~"):initialize");   
    }
    super.initialize(configSettings);

    this
      .language("en") 
      .mimetype("text/html");
    
    requestReader = MVCRequestReader(this);
    sessionReader = SessionReader(this);  
 
    this
      .links(MVCLinkContainer)
      .metas(MVCMetaContainer) 
      .scripts(ScriptContainer) 
      .styles(StyleContainer); 
  }

  // inherited
  override DETBBase database() { return super.database; }

  // Containers
  
  mixin(OProperty!("DMVCLinkContainer", "links"));
  mixin(OProperty!("DMVCMetaContainer", "metas"));
  mixin(OProperty!("DScriptContainer", "scripts"));
  mixin(OProperty!("DStyleContainer", "styles"));

	// #region Layout
    protected ILayout _layout;
    @property O layout(this O)(ILayout newlayout) { 
      _layout = newlayout; 
      return cast(O)this; 
    }

    @property ILayout layout() { 
      return _layout; 
    }
	// #endregion Layout

  mixin(OProperty!("DETBCollection", "collection"));
  mixin(OProperty!("DEntity", "site"));
  mixin(OProperty!("DETBTenant", "tenant"));

  mixin(OProperty!("Session", "globalSession"));
  mixin(OProperty!("string[]", "pageActions"));
  mixin(OProperty!("bool", "hasGlobalSession"));
  mixin(OProperty!("IForm", "form"));

  mixin(OProperty!("IView", "view"));
  mixin(OProperty!("IView", "errorView"));

  // Required checks for the page flow
  mixin(OProperty!("string[]", "sessionData"));

  mixin(MVCParameter!("canonical")); 
  mixin(MVCParameter!("jsPath")); 
  mixin(MVCParameter!("pageTitle"));
  mixin(MVCParameter!("pageBreadcrumbs"));
  mixin(MVCParameter!("pgPath")); 
  mixin(MVCParameter!("title")); 

  DMVCRequestReader requestReader;
  DSessionReader sessionReader;

  O pageActions(this O)(string[] actions...) { this.pageActions(actions); return cast(O)this; }
  O addPageActions(this O)(string[] actions...) { this.addPageActions(actions); return cast(O)this; }
  O addPageActions(this O)(string[] actions) { this.pageActions(this.pageActions~actions); return cast(O)this; }

  mixin(OProperty!("ViewModes", "viewMode")); // 0 - HTML , 1 - HTML & Javascript, 2 - PWA
  mixin(OProperty!("DataModes", "dataMode")); // 0 - HTML , 1 - HTML & Javascript, 2 - PWA
 
  DH5Obj[] pageContent(STRINGAA reqParameters) { 
    debugMethodCall(moduleName!DPageController~":DPageController("~this.name~")::pageContent");
    // auto result = form ? form.toH5(reqParameters) : null;

    // debug writeln("return result pageContent(STRINGAA reqParameters)");
    // return result;
    return null; 
  }

  void jsCode(STRINGAA options = null) {
    debugMethodCall(moduleName!DPageController~":DPageController::jsCode");
    string internalSessionId = _request && _request.session ? _request.session.id : options.get("internalSessionId", "");
    auto internalSession = sessionManager.session(options);

    if (internalSession && viewMode == ViewModes.JS) 
      addToPageScript(options, 
        setSessionStorage(["sessionId": (internalSession.session ? internalSession.session.id.toString : ""), "siteId": (internalSession.site ? internalSession.site.id.toString : "")]));
  }

  override void afterResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DPageController~":DPageController::afterResponse");
    super.afterResponse(options);
  }  

/*   mixin(OProperty!("DController", "securityController")); 
  mixin(OProperty!("DAPPSecurityOptions", "securityOptions"));
  O securityOptions(this O)(bool[string] newOptions) { this.securityOptions(APPSecurityOptions(newOptions)); return cast(O)this; }  
 */ 

  /*   override DH5Obj[] toH5(STRINGAA reqParameters) { 
    auto loginId = reqParameters.get("loginId", "");
    // debug writeln("...in login2:loginid = ", loginId);
    auto body_ = H5Div(["page-wrapper"], 
      (showAppTitle ? "appTitle" : "")~
      pageBody.toString
    ).toString;
  } */

  /* Json toJson(STRINGAA reqParameters) {
    Json result = Json.emptyObject; // super.toJson(reqParameters);

    result["login"] = this.login; 
    if (this.loginRequired) {
      auto loginId = reqParameters.get("loginId", "");
      requestHTTP(reqParameters.get("httpMode", "")~"://"~reqParameters.get("Host", "")~"/api/v1/logins?id="~loginId,
        (scope req) {
          req.method = HTTPMethod.POST;
          req.writeJsonBody(["id": loginId]);
        },
        (scope res) {
          this.login(parseJsonString(res.bodyReader.readAllUTF8()));
          logInfo("login: %s", this.login);
        }
      );

      if (this.login == Json(null)) {
        // debug writeln("login not found");
        _response.redirect("/login");
        return result;
      }
    }
    result["login"] = this.login; 

    string sessionId;
    result["session"] = this.session; 
    if (this.sessionRequired) {
      if (!_request.session) { 
        // debug writeln("No session available");
        _response.redirect("/login");  
        return result; } 
      
      sessionId = readSessionId(_request, reqParameters);
      
      if (sessionId.empty) {
        _response.redirect("/login");
        return result;
      }

      requestHTTP(reqParameters.get("httpMode", "")~"://"~reqParameters.get("Host", "")~"/api/v1/sessions?id="~reqParameters.get("sessionId", ""),
        (scope req) {
          req.method = HTTPMethod.POST;
          req.writeJsonBody(["name": "My Name"]);
        },
        (scope res) {
          this.session(parseJsonString(res.bodyReader.readAllUTF8()));
          logInfo("session: %s", this.session);
        }
      );

      if (this.session == Json(null)) {
        // debug writeln("session not found");
        _response.redirect("/login");
        return result;
      }
      _session.remove("_id");
      _session["lastAccess"] = toTimestamp(now());
      this.app.database.update("central", "sessions", ["id":sessionId], session); 
    }
    result["session"] = this.session; 
/*     reqParameters.addScript(
      setSessionStorage(
        ["sessionId":reqParameters.get("sessionId", "")]
      )
    );
 * /
    string siteId;
    result["site"] = this.site; 
    if (this.siteRequired) {
      siteId = reqParameters.get("siteId", "");
      
      if (siteId.empty) {
        _response.redirect("/sites");
        return result;
      }

      requestHTTP(reqParameters.get("httpMode", "")~"://"~reqParameters.get("Host", "")~"/api/v1/sites?id="~reqParameters.get("siteId", ""),
        (scope req) {
          req.method = HTTPMethod.POST;
          req.writeJsonBody(["siteId": siteId]);
        },
        (scope res) {
          this.site(parseJsonString(res.bodyReader.readAllUTF8()));
          logInfo("site: %s", this.site);
        }
      );

      if (this.site == Json(null)) {
        // debug writeln("site not found");
        _response.redirect("/login");
        return result;
      }
      _site.remove("_id");
      _site["lastAccess"] = toTimestamp(now());
      this.app.database.update("central", "sites", ["id":siteId], site); 
    }
    result["site"] = this.site; 
/*     reqParameters.addScript(
      setSessionStorage(["siteId":reqParameters.get("siteId", "")])); 
 * /
    return result;
  } */

  // #region Response
    override bool beforeResponse(STRINGAA options = null) {
      debugMethodCall(moduleName!DPageController~":DPageController("~this.name~")::beforeResponse");
      super.beforeResponse(options);

      auto mySession = sessionManager.session(options);
      // ?? TODO if (internalSession) { this.site(session.site); }
      //     if (hasError || "redirect" in options) { return; }

      return true;
    }    

    override string stringResponse(string[string] options = null) {
      debugMethodCall(moduleName!DPageController~":DPageController("~name~")::stringResponse");
      super.stringResponse(options);
      // if (hasError) { return null; }

      string myRenderedView = view ? view.render(options) : "";
      return this.layout 
        ? this.layout.render(this, myRenderedView)  
        : myRenderedView;  
    }
  // #endregion Response
}
mixin(ControllerCalls!("PageController"));

version(test_uim_mvc) { unittest {
  assert(PageController);
}}
