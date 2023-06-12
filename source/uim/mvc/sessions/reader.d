/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.sessions.reader;

import uim.mvc;
@safe:

class DInternalSessionReader {
  this(IPageController page) {
    this.page(page);
  }

  mixin(OProperty!("IPageController", "page"));
  mixin(OProperty!("DInternalSession", "internalSession"));

  DInternalSession read(HTTPServerRequest serverRequest, STRINGAA requestParameters) {
    debug writeln(moduleName!DInternalSessionReader~":DInternalSessionReader::read");
    
    // serverRequest exists?
    if (!serverRequest) { debug writeln(moduleName!DInternalSessionReader~":DInternalSessionReader::read - missing request"); }

    // serverRequest has session
    string requestSessionId;
    DInternalSession myInternalSession;
    if (!serverRequest.session) { // no session
      debug writeln(moduleName!DInternalSessionReader~":DInternalSessionReader::read - missing request session"); }
    else { // has sesion
      debug writeln(moduleName!DInternalSessionReader~":DInternalSessionReader::read - httpSessionId exists");
      
      // read session Id
      requestSessionId = serverRequest.session.id;
      myInternalSession = internalSessions.get(requestSessionId, null); // Existing Session?
    }

    if (!myInternalSession) debug writeln(moduleName!DInternalSessionReader~":DInternalSessionReader::read - missing internalSession");
    
    debug writeln(moduleName!DInternalSessionReader~":DInternalSessionReader::read - XXXX");

    if (requestSessionId.length > 0) 
      debug writeln(moduleName!DInternalSessionReader~":DInternalSessionReader::read - x1x");
    if (internalSession is null)  
      debug writeln(moduleName!DInternalSessionReader~":DInternalSessionReader::read - x2x");

    if (requestSessionId.length > 0 && myInternalSession is null) { // httpSession exitsts New Session
      debug writeln(moduleName!DInternalSessionReader~":DInternalSessionReader::read - httpSessionId exists internalSession is missing");
      debug writeln(moduleName!DInternalSessionReader~":DInternalSessionReader::read - Creating new internalSession based on httpSession ", requestSessionId);
      myInternalSession = InternalSession(serverRequest.session, page);

      debug writeln(moduleName!DInternalSessionReader~":DInternalSessionReader::read - Reading session entities");      
      if (page && page.database) {
      foreach (name; page.sessionData) {
          switch(name) {
            case "login": 
              if (auto myDatabase = page.database["systems", "system_logins"]) {
                myInternalSession.login = myDatabase.findOne(["id": requestParameters.get("loginId", "")]);
              }
              break;
            case "session":
              if (auto myDatabase = page.database["systems", "system_sessions"]) {
                myInternalSession.session = myDatabase.findOne(["id": requestParameters.get("sessionId", "")]);
              }
              break;
            case "site": 
              if (auto myDatabase = page.database["systems", "system_sites"]) {
                myInternalSession.site = myDatabase.findOne(["id": requestParameters.get("siteId", "")]);
              }
              break;
            case "account": 
              if (auto myDatabase = page.database["systems", "system_accounts"]) {
                myInternalSession.account = myDatabase.findOne(["id": requestParameters.get("accountId", "")]);
              }
              break;
            case "user": 
              if (auto myDatabase = page.database["systems", "system_users"]) {
                myInternalSession.user = myDatabase.findOne(["id": requestParameters.get("userId", "")]);
              }
              break;
            default: break;
          }        
        }
      }
    }

    // debug writeln("----------------------------------------------------------------------------------------------"); 
    if (myInternalSession) {
      debug writeln("LoginId = %s\tSessionId = %s\tSiteId = %s".format(
        myInternalSession.login ? myInternalSession.login.id.toString : "", 
        myInternalSession.session ? myInternalSession.session.id.toString : "", 
        myInternalSession.site ? myInternalSession.site.id.toString : "")
      );

      myInternalSession.lastAccessedOn = toTimestamp(now); // Update time
      requestParameters["reqSessionId"] = requestSessionId; // Update request parameters
      internalSessions[requestSessionId] = myInternalSession; // Return to session store
    }
    else {
      // debug writeln("No internalSession");
    } 
    // debug writeln("----------------------------------------------------------------------------------------------"); 

    return internalSession;
  }
}
auto InternalSessionReader(IPageController page) { return new DInternalSessionReader(page); }