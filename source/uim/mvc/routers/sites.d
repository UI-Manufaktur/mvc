/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.routers.sites;

import uim.mvc;
@safe:

/* void uimSites(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimSites~":uimSites");

  PageController(thisServer).request(req, res);
}

void uimSiteSelectAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimSiteSelectAction~":uimSiteSelectAction");

  SelectSiteActionController(thisServer).request(req, res);
}
 */
/* 
static this() {
  server.pages("sites", new class DPageController {
    this() { 
      super();
      this
      .checks([APPCheckInternalSession, APPCheckSession]);
    }

    override DH5Obj toH5(STRINGAA options = null) {
      super.toH5(requestParameters);

      // // debugwriteln(StyledString("In server.index...").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
      // debugwriteln("server.index -> requestParameters = ", requestParameters);
      // debugwriteln("server.index -> pageTitle = ", requestParameters.get("pageTitle", ""));

      DEntity session;
      DEntity site;
      auto session = sessionManager.session(options);
      if (internalSession) {
        session = session.session; 
        site    = session.site; }
      auto sessionId = session ? session.id.toString : "";
  
      auto sites = DEntityBase", "entityBase ? DEntityBase", "entityBase["central", "sites"].findMany : null;
      DH5Obj[] sitesContent; 
      sites.each!(a => sitesContent ~= 
        cast(DH5Obj)H5Div(["col-md-6 col-xl-3"],
          H5Div(["ratio ratio-1x1"], 
            BS5Form(["method":"Post", "action": "/sites/select"], 
              BS5Card
                .body_(["text-center"], 
                  H5InputHidden("sessionId", ["name":"sessionId", "value":sessionId]),
                  H5InputHidden("siteId", ["name":"siteId", "value":a.id.toString]),
                  H5Div(["card-title mb-1"], a.display),
                  H5Div(["text-muted"], BS5ButtonSubmit(["btn-info"], "Site auswählen")))))));

      return
        H5Div(["content"],
          H5Div(["container-xl"], 
            BS5Row("messages", [""]),
            BS5Row(["row-deck row-cards"], sitesContent)));
        
/*         requestParameters["script"] = requestParameters.get("script", "")
        ~"sessionStorage.setItem('sessionId', '%s'); sessionStorage.setItem('siteId', '%s');".format(sessionId, siteId);
 * /

      }
    }
  );
}

 */