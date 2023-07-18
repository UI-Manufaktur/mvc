/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.sessions.reader;

import uim.mvc;
@safe:
/* 
class DSessionReader {
  this(IPageController page) {
    this.page(page);
  }

  mixin(OProperty!("IPageController", "page"));
  mixin(OProperty!("DSession", "session"));

  DSession read(HTTPServerRequest serverRequest, STRINGAA requestParameters) {
    // debugwriteln(moduleName!DSessionReader~":DSessionReader::read");
    
    // serverRequest exists?
    if (!serverRequest) { // debugwriteln(moduleName!DSessionReader~":DSessionReader::read - missing request"); }

    // serverRequest has session
    string requestSessionId;
    DSession mySession;
    if (!serverRequest.session) { // no session
      // debugwriteln(moduleName!DSessionReader~":DSessionReader::read - missing request session"); }
    else { // has sesion
      // debugwriteln(moduleName!DSessionReader~":DSessionReader::read - httpSessionId exists");
      
      // read session Id
      requestSessionId = serverRequest.session.id;
      mySession = sessions.get(requestSessionId, null); // Existing Session?
    }

    if (!mySession) // debugwriteln(moduleName!DSessionReader~":DSessionReader::read - missing session");
    
    // debugwriteln(moduleName!DSessionReader~":DSessionReader::read - XXXX");

    if (requestSessionId.length > 0) 
      // debugwriteln(moduleName!DSessionReader~":DSessionReader::read - x1x");
    if (session is null || session.isNull)  
      // debugwriteln(moduleName!DSessionReader~":DSessionReader::read - x2x");

    if (requestSessionId.length > 0 && mySession is null) { // httpSession exitsts New Session
      // debugwriteln(moduleName!DSessionReader~":DSessionReader::read - httpSessionId exists session is missing");
      // debugwriteln(moduleName!DSessionReader~":DSessionReader::read - Creating new session based on httpSession ", requestSessionId);
      // mySession = Session(serverRequest.session);

      // debugwriteln(moduleName!DSessionReader~":DSessionReader::read - Reading session entities");      
      if (page && page.DEntityBase", "entityBase) {
      foreach (name; page.sessionData) {
          switch(name) {
            case "login": 
              if (auto myEntityBase = page.DEntityBase", "entityBase["systems", "system_logins"]) {
                mySession.login = myEntityBase.findOne(["id": requestParameters.get("loginId", "")]);
              }
              break;
            case "session":
              if (auto myEntityBase = page.DEntityBase", "entityBase["systems", "system_sessions"]) {
                mySession.session = myEntityBase.findOne(["id": requestParameters.get("sessionId", "")]);
              }
              break;
            case "site": 
              if (auto myEntityBase = page.DEntityBase", "entityBase["systems", "system_sites"]) {
                mySession.site = myEntityBase.findOne(["id": requestParameters.get("siteId", "")]);
              }
              break;
            case "account": 
              if (auto myEntityBase = page.DEntityBase", "entityBase["systems", "system_accounts"]) {
                mySession.account = myEntityBase.findOne(["id": requestParameters.get("accountId", "")]);
              }
              break;
            case "user": 
              if (auto myEntityBase = page.DEntityBase", "entityBase["systems", "system_users"]) {
                mySession.user = myEntityBase.findOne(["id": requestParameters.get("userId", "")]);
              }
              break;
            default: break;
          }        
        }
      }
    }

    // // debugwriteln("----------------------------------------------------------------------------------------------"); 
    if (mySession) {
      // debugwriteln("LoginId = %s\tSessionId = %s\tSiteId = %s".format(
        mySession.login ? mySession.login.id.toString : "", 
        mySession.session ? mySession.session.id.toString : "", 
        mySession.site ? mySession.site.id.toString : "")
      );

      mySession.lastAccessedOn = toTimestamp(now); // Update time
      requestParameters["reqSessionId"] = requestSessionId; // Update request parameters
      sessions[requestSessionId] = mySession; // Return to session store
    }
    else {
      // // debugwriteln("No session");
    } 
    // // debugwriteln("----------------------------------------------------------------------------------------------"); 

    return session;
  }
}
auto SessionReader(IPageController page) { return new DSessionReader(page); }

 */
/* class DSRVSessionReader {
  this(DSRVApi api) { _api = api; }

  mixin(OProperty!("DSRVApi", "api"));
  mixin(OProperty!("DSRVSession", "servSession"));

  DSRVSession read(HTTPServerRequest req, STRINGAA reqParameters) {
    // debugwriteln(moduleName!DSRVSessionReader~":DSRVSessionReader::read");
    DSRVSession srvSession;
    string reqSessionId;
    if (!req) // debugwriteln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - missing request");
    if (!req.session) { // debugwriteln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - mising request session"); }
    else {
      // debugwriteln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - httpSessionId exists");
      reqSessionId = req.session.id;
      srvSession = srvSessions.get(reqSessionId, null); // Existing Session?
    }

    if (!srvSession) // debugwriteln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - missing srvSession");
    
    // debugwriteln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - XXXX");

    if (reqSessionId.length > 0) 
      // debugwriteln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - x1x");
    if (srvSession is null)  
      // debugwriteln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - x2x");

    if (reqSessionId.length > 0 && srvSession is null) { // httpSession exitsts New Session
      // debugwriteln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - httpSessionId exists srvSession is missing");
      // debugwriteln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - Creating new srvSession based on httpSession ", reqSessionId);
      srvSession = SRVSession(req.session);

      // debugwriteln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - Reading session entities");      
      if (api && api.DEntityBase", "entityBase) {
        foreach (required; api.requiredChecks) {
          switch(required) {
            case "login": 
              srvSession.login = api.DEntityBase", "entityBase["central", "logins"].findOne(["id": reqParameters.get("loginId", "")]);
              break;
            case "session":
              srvSession.session = api.DEntityBase", "entityBase["central", "sessions"].findOne(["id": reqParameters.get("sessionId", "")]);
              break;
            case "site": 
              srvSession.site = api.DEntityBase", "entityBase["central", "sites"].findOne(["id": reqParameters.get("siteId", "")]);
              break;
            case "account": 
              srvSession.account = api.DEntityBase", "entityBase["central", "accounts"].findOne(["id": reqParameters.get("accountId", "")]);
              break;
            case "user": 
              srvSession.user = api.DEntityBase", "entityBase["central", "users"].findOne(["id": reqParameters.get("userId", "")]);
              break;
            default: break;
          }        
        }
      }
    }

    // debugwriteln("----------------------------------------------------------------------------------------------"); 
    if (srvSession) {
      // debugwriteln("LoginId = %s\tSessionId = %s\tSiteId = %s".format(
      srvSession.login ? srvSession.login.id.toString : "", 
      srvSession.session ? srvSession.session.id.toString : "", 
      srvSession.site ? srvSession.site.id.toString : ""));

      srvSession.lastAccessedOn = toTimestamp(now);
      reqParameters["reqSessionId"] = reqSessionId;
      srvSessions[reqSessionId] = srvSession;
    }
    else {
      // debugwriteln("No srvSession");
    } 
    // debugwriteln("----------------------------------------------------------------------------------------------"); 

    return srvSession;
  }
}
auto SRVSessionReader(DSRVApi api) { return new DSRVSessionReader(api); } */