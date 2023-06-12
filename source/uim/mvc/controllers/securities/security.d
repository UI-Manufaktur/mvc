module uim.mvc.controllers.securities.security;

import uim.mvc;
@safe:

class DAPPSecurityController : DController {
  mixin(ControllerThis!("APPSecurityController"));

  override Json message(STRINGAA options) {
    // debug writeln("In DAPPSecurityController");
    auto json = super.message(options);
   
    string internalSessionId = options.get("internalSessionId", "");
    auto internalSession = getInternalSession(options);

    /* if (internalSession) {
      /// login required ?
      auto jsonResults = json["results"];
      if (page.securityOptions.required("login")) {
        auto jsLogin = APPValidatorLogin(page, database).message(json, reqParameters);
        if (jsLogin != Json(null))
          internalSession.login = createEntities["login"](jsLogin);
      }

      if (page.securityOptions.required("session")) {
        auto jsSession = APPValidatorSession(page, database).message(json, reqParameters);
        // debug writeln("-> with session: ", jsSession);
        if (jsSession != Json(null))
          internalSession.session = createEntities["session"](jsSession);
      }

      if (page.securityOptions.required("site")) {        
        auto jsSite = APPValidatorSite(page, database).message(json, reqParameters);
        // debug writeln("-> with site: ", jsSite);
        if (jsSite != Json(null)) 
          internalSession.site = createEntities["site"](jsSite);
      }
    }

    if (page && internalSession) {
      /// Check if session valid (if required)
      if (page.securityOptions.required("session") && !internalSession.session) page._response.redirect("/login"); 
      else // Check if site  valid (if required)
        if (page.securityOptions.required("site") && !internalSession.site) page._response.redirect("/sites"); 
    } */

    return json;
  }
  version(test_uim_apps) {
    unittest {
      writeln("--- Test in ", __MODULE__, "/", __LINE__);
      
    /// TODO 
  }}

  override Json message(Json json, STRINGAA options) {
    return super.message(json, options); }
} 
mixin(ControllerCalls!("APPSecurityController"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    /// TODO 
  }}