/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.sessions.reader;

import uim.mvc;
@safe:

class DSessionReader {
  this(IPageController page) {
    this.page(page);
  }

  mixin(OProperty!("IPageController", "page"));
  mixin(OProperty!("DSession", "session"));

  DSession read(HTTPServerRequest serverRequest, STRINGAA requestParameters) {
    debug writeln(moduleName!DSessionReader~":DSessionReader::read");
    
    // serverRequest exists?
    if (!serverRequest) { debug writeln(moduleName!DSessionReader~":DSessionReader::read - missing request"); }

    // serverRequest has session
    string requestSessionId;
    DSession mySession;
    if (!serverRequest.session) { // no session
      debug writeln(moduleName!DSessionReader~":DSessionReader::read - missing request session"); }
    else { // has sesion
      debug writeln(moduleName!DSessionReader~":DSessionReader::read - httpSessionId exists");
      
      // read session Id
      requestSessionId = serverRequest.session.id;
      mySession = sessions.get(requestSessionId, null); // Existing Session?
    }

    if (!mySession) debug writeln(moduleName!DSessionReader~":DSessionReader::read - missing session");
    
    debug writeln(moduleName!DSessionReader~":DSessionReader::read - XXXX");

    if (requestSessionId.length > 0) 
      debug writeln(moduleName!DSessionReader~":DSessionReader::read - x1x");
    if (session is null || session.isNull)  
      debug writeln(moduleName!DSessionReader~":DSessionReader::read - x2x");

    if (requestSessionId.length > 0 && mySession is null) { // httpSession exitsts New Session
      debug writeln(moduleName!DSessionReader~":DSessionReader::read - httpSessionId exists session is missing");
      debug writeln(moduleName!DSessionReader~":DSessionReader::read - Creating new session based on httpSession ", requestSessionId);
      // mySession = Session(serverRequest.session);

      debug writeln(moduleName!DSessionReader~":DSessionReader::read - Reading session entities");      
      if (page && page.database) {
      foreach (name; page.sessionData) {
          switch(name) {
            case "login": 
              if (auto myDatabase = page.database["systems", "system_logins"]) {
                mySession.login = myDatabase.findOne(["id": requestParameters.get("loginId", "")]);
              }
              break;
            case "session":
              if (auto myDatabase = page.database["systems", "system_sessions"]) {
                mySession.session = myDatabase.findOne(["id": requestParameters.get("sessionId", "")]);
              }
              break;
            case "site": 
              if (auto myDatabase = page.database["systems", "system_sites"]) {
                mySession.site = myDatabase.findOne(["id": requestParameters.get("siteId", "")]);
              }
              break;
            case "account": 
              if (auto myDatabase = page.database["systems", "system_accounts"]) {
                mySession.account = myDatabase.findOne(["id": requestParameters.get("accountId", "")]);
              }
              break;
            case "user": 
              if (auto myDatabase = page.database["systems", "system_users"]) {
                mySession.user = myDatabase.findOne(["id": requestParameters.get("userId", "")]);
              }
              break;
            default: break;
          }        
        }
      }
    }

    // debug writeln("----------------------------------------------------------------------------------------------"); 
    if (mySession) {
      debug writeln("LoginId = %s\tSessionId = %s\tSiteId = %s".format(
        mySession.login ? mySession.login.id.toString : "", 
        mySession.session ? mySession.session.id.toString : "", 
        mySession.site ? mySession.site.id.toString : "")
      );

      mySession.lastAccessedOn = toTimestamp(now); // Update time
      requestParameters["reqSessionId"] = requestSessionId; // Update request parameters
      sessions[requestSessionId] = mySession; // Return to session store
    }
    else {
      // debug writeln("No session");
    } 
    // debug writeln("----------------------------------------------------------------------------------------------"); 

    return session;
  }
}
auto SessionReader(IPageController page) { return new DSessionReader(page); }


/* class DSRVSessionReader {
  this(DSRVApi api) { _api = api; }

  mixin(OProperty!("DSRVApi", "api"));
  mixin(OProperty!("DSRVSession", "servSession"));

  DSRVSession read(HTTPServerRequest req, STRINGAA reqParameters) {
    debug writeln(moduleName!DSRVSessionReader~":DSRVSessionReader::read");
    DSRVSession srvSession;
    string reqSessionId;
    if (!req) debug writeln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - missing request");
    if (!req.session) { debug writeln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - mising request session"); }
    else {
      debug writeln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - httpSessionId exists");
      reqSessionId = req.session.id;
      srvSession = srvSessions.get(reqSessionId, null); // Existing Session?
    }

    if (!srvSession) debug writeln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - missing srvSession");
    
    debug writeln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - XXXX");

    if (reqSessionId.length > 0) 
      debug writeln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - x1x");
    if (srvSession is null)  
      debug writeln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - x2x");

    if (reqSessionId.length > 0 && srvSession is null) { // httpSession exitsts New Session
      debug writeln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - httpSessionId exists srvSession is missing");
      debug writeln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - Creating new srvSession based on httpSession ", reqSessionId);
      srvSession = SRVSession(req.session);

      debug writeln(moduleName!DSRVSessionReader~":DSRVSessionReader::read - Reading session entities");      
      if (api && api.database) {
        foreach (required; api.requiredChecks) {
          switch(required) {
            case "login": 
              srvSession.login = api.database["central", "logins"].findOne(["id": reqParameters.get("loginId", "")]);
              break;
            case "session":
              srvSession.session = api.database["central", "sessions"].findOne(["id": reqParameters.get("sessionId", "")]);
              break;
            case "site": 
              srvSession.site = api.database["central", "sites"].findOne(["id": reqParameters.get("siteId", "")]);
              break;
            case "account": 
              srvSession.account = api.database["central", "accounts"].findOne(["id": reqParameters.get("accountId", "")]);
              break;
            case "user": 
              srvSession.user = api.database["central", "users"].findOne(["id": reqParameters.get("userId", "")]);
              break;
            default: break;
          }        
        }
      }
    }

    debug writeln("----------------------------------------------------------------------------------------------"); 
    if (srvSession) {
      debug writeln("LoginId = %s\tSessionId = %s\tSiteId = %s".format(
      srvSession.login ? srvSession.login.id.toString : "", 
      srvSession.session ? srvSession.session.id.toString : "", 
      srvSession.site ? srvSession.site.id.toString : ""));

      srvSession.lastAccessedOn = toTimestamp(now);
      reqParameters["reqSessionId"] = reqSessionId;
      srvSessions[reqSessionId] = srvSession;
    }
    else {
      debug writeln("No srvSession");
    } 
    debug writeln("----------------------------------------------------------------------------------------------"); 

    return srvSession;
  }
}
auto SRVSessionReader(DSRVApi api) { return new DSRVSessionReader(api); } */