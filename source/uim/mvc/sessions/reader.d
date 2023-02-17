module uim.mvc.sessions.reader;

@safe:
import uim.mvc;

class DMVCSessionReader {
  this(DPageController page) {
    this.page(page);
  }

  mixin(OProperty!("DPageController", "page"));
  mixin(OProperty!("DMVCSession", "appSession"));

  DMVCSession read(HTTPServerRequest req, STRINGAA reqParameters) {
    debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read");
    DMVCSession appSession;
    string reqSessionId;
    if (!req) debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - missing request");
    if (!req.session) { debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - mising request session"); }
    else {
      debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - httpSessionId exists");
      reqSessionId = req.session.id;
      appSession = appSessions.get(reqSessionId, null); // Existing Session?
    }

    if (!appSession) debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - missing appSession");
    
    debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - XXXX");

    if (reqSessionId.length > 0) 
      debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - x1x");
    if (appSession is null)  
      debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - x2x");

    if (reqSessionId.length > 0 && appSession is null) { // httpSession exitsts New Session
      debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - httpSessionId exists appSession is missing");
      debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - Creating new appSession based on httpSession ", reqSessionId);
      appSession = MVCSession(req.session, page);

      debug writeln(moduleName!DMVCSessionReader~":DMVCSessionReader::read - Reading session entities");      
      if (page && page.database) {
      foreach (name; page.sessionData) {
          switch(name) {
            case "login": 
              appSession.login = page.database["systems", "system_logins"].findOne(["id": reqParameters.get("loginId", "")]);
              break;
            case "session":
              appSession.session = page.database["systems", "system_sessions"].findOne(["id": reqParameters.get("sessionId", "")]);
              break;
            case "site": 
              appSession.site = page.database["systems", "system_sites"].findOne(["id": reqParameters.get("siteId", "")]);
              break;
            case "account": 
              appSession.account = page.database["systems", "system_accounts"].findOne(["id": reqParameters.get("accountId", "")]);
              break;
            case "user": 
              appSession.user = page.database["systems", "system_users"].findOne(["id": reqParameters.get("userId", "")]);
              break;
            default: break;
          }        
        }
      }
    }

    // debug writeln("----------------------------------------------------------------------------------------------"); 
    if (appSession) {
      debug writeln("LoginId = %s\tSessionId = %s\tSiteId = %s".format(
        appSession.login ? appSession.login.id.toString : "", 
        appSession.session ? appSession.session.id.toString : "", 
        appSession.site ? appSession.site.id.toString : "")
      );

      appSession.lastAccessedOn = toTimestamp(now);
      reqParameters["reqSessionId"] = reqSessionId;
      appSessions[reqSessionId] = appSession;
    }
    else {
      // debug writeln("No appSession");
    } 
    // debug writeln("----------------------------------------------------------------------------------------------"); 

    return appSession;
  }
}
auto MVCSessionReader(DPageController page) { return new DMVCSessionReader(page); }