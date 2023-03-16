/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.sessions.reader;

@safe:
import uim.mvc;

class DMVCSessionReader {
  this(IPageController page) {
    this.page(page);
  }

  mixin(OProperty!("IPageController", "page"));
  mixin(OProperty!("DMVCSession", "appSession"));

  DMVCSession read(HTTPServerRequest serverRequest, STRINGAA requestParameters) {
    debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read");
    
    // serverRequest exists?
    if (!serverRequest) { debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - missing request"); }

    // serverRequest has session
    string requestSessionId;
    DMVCSession myAppSession;
    if (!serverRequest.session) { // no session
      debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - missing request session"); }
    else { // has sesion
      debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - httpSessionId exists");
      
      // read session Id
      requestSessionId = serverRequest.session.id;
      myAppSession = appSessions.get(requestSessionId, null); // Existing Session?
    }

    if (!myAppSession) debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - missing appSession");
    
    debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - XXXX");

    if (requestSessionId.length > 0) 
      debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - x1x");
    if (appSession is null)  
      debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - x2x");

    if (requestSessionId.length > 0 && myAppSession is null) { // httpSession exitsts New Session
      debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - httpSessionId exists appSession is missing");
      debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - Creating new appSession based on httpSession ", requestSessionId);
      myAppSession = MVCSession(serverRequest.session, page);

      debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - Reading session entities");      
      if (page && page.database) {
      foreach (name; page.sessionData) {
          switch(name) {
            case "login": 
              myAppSession.login = page.database["systems", "system_logins"].findOne(["id": requestParameters.get("loginId", "")]);
              break;
            case "session":
              myAppSession.session = page.database["systems", "system_sessions"].findOne(["id": requestParameters.get("sessionId", "")]);
              break;
            case "site": 
              myAppSession.site = page.database["systems", "system_sites"].findOne(["id": requestParameters.get("siteId", "")]);
              break;
            case "account": 
              myAppSession.account = page.database["systems", "system_accounts"].findOne(["id": requestParameters.get("accountId", "")]);
              break;
            case "user": 
              myAppSession.user = page.database["systems", "system_users"].findOne(["id": requestParameters.get("userId", "")]);
              break;
            default: break;
          }        
        }
      }
    }

    // debug writeln("----------------------------------------------------------------------------------------------"); 
    if (myAppSession) {
      debug writeln("LoginId = %s\tSessionId = %s\tSiteId = %s".format(
        myAppSession.login ? myAppSession.login.id.toString : "", 
        myAppSession.session ? myAppSession.session.id.toString : "", 
        myAppSession.site ? myAppSession.site.id.toString : "")
      );

      myAppSession.lastAccessedOn = toTimestamp(now); // Update time
      requestParameters["reqSessionId"] = requestSessionId; // Update request parameters
      appSessions[requestSessionId] = myAppSession; // Return to session store
    }
    else {
      // debug writeln("No appSession");
    } 
    // debug writeln("----------------------------------------------------------------------------------------------"); 

    return appSession;
  }
}
auto MVCSessionReader(IPageController page) { return new DMVCSessionReader(page); }