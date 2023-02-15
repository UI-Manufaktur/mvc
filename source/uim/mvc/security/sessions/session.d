module uim.mvc.security.sessions.session;

@safe:
import uim.mvc;

class DSession {
  this() {}

  this(vibe.http.session.Session httpSession) {
    _httpSession = httpSession;
    this.id(httpSession.id); }

  this(vibe.http.session.Session httpSession, DPageController page) {
    this(httpSession);
    this.page(page); }

  mixin(OProperty!("string", "id"));
  vibe.http.session.Session _httpSession;

  mixin(OProperty!("DPageController", "page"));
  mixin(OProperty!("long", "lastAccessedOn"));
  mixin(OProperty!("DEntity", "login"));
  mixin(OProperty!("DEntity", "session"));
  mixin(OProperty!("DEntity", "site"));
  mixin(OProperty!("DEntity", "account"));
  mixin(OProperty!("DEntity", "user"));
  mixin(OProperty!("DEntity", "password"));
  mixin(OProperty!("DEntity", "entity"));

  bool isValid(string[] checks, STRINGAA reqParameters) {
    foreach (check; checks) {
      debug writeln(moduleName!DSession~":DSession::beforeResponse - Check "~check);
      switch (check) {
        case "login": if (!login) {
          debug writeln(moduleName!DSession~":DSession::beforeResponse -> No login => redirect /login");
          reqParameters["redirect"] = "/login";
          return false; } 
          login.lastAccessedOn(toTimestamp(now)).save; break;
        case "session": if (!session) {
          debug writeln(moduleName!DSession~":DSession::beforeResponse -> No session => redirect /login");
          reqParameters["redirect"] = "/login";
          return false; } 
          session.lastAccessedOn(toTimestamp(now)).save; break;
        case "site": if (!site) {
          debug writeln(moduleName!DSession~":DSession::beforeResponse -> No site => redirect /");
          reqParameters["redirect"] = "/";
          return false; }
          site.lastAccessedOn(toTimestamp(now)).save; break;
        case "account": if (!account) {
          debug writeln(moduleName!DSession~":DSession::beforeResponse -> No account => redirect /login");
          reqParameters["redirect"] = "/login";
          return false; } break;
        case "password": if (!password) {
          debug writeln(moduleName!DSession~":DSession::beforeResponse -> No password => redirect /login");
          reqParameters["redirect"] = "/login";
          return false; } 
          password.lastAccessedOn(toTimestamp(now)).save; break;
        case "user": if (!user) {
          debug writeln(moduleName!DSession~":DSession::beforeResponse -> No user => redirect /login");
          reqParameters["redirect"] = "/login";
          return false; } 
          user.lastAccessedOn(toTimestamp(now)).save; break;
        case "database": if (!page && page.database) {
          debug writeln(moduleName!DSession~":DSession::beforeResponse -> No site => redirect /error");
          reqParameters["redirect"] = "/error?message=database";
          return false; } break;
        default: break;
      }      
    }
    return true;
  }
  string debugInfo() {
    return 
      "\n Id:\t%s".format(id)~
      "\n LastAccessOn:\t%s".format(lastAccessedOn)~
      "\n Session:\t"~(session ? "id(siteId):%s(%s)".format(session.id, session["siteId"]) : "null")~ 
      "\n Login:\t"~(login ? "id:%s".format(login.id) : "null")~ 
      "\n Site:\t"~(site ? "id/name:%s/%s".format(site.id, site.name) : "null")~ 
      "\n Account:\t"~(account ? "id/name:%s/%s".format(account.id, account.name) : "null")~ 
      "\n Password:\t"~(password ? "id:%s".format(password.id) : "null")~
      "\n User:\t"~(user ? "id:%s".format(user.id) : "null");
  }
}
auto Session(vibe.http.session.Session httpSession) { return new DSession(httpSession); }
auto Session(vibe.http.session.Session httpSession, DPageController page) { return new DSession(httpSession, page); }

/*   mixin(OProperty!("DPageController", "page"));
  mixin(OProperty!("long", "lastAccessedOn"));
  mixin(OProperty!("DEntity", "login"));
  mixin(OProperty!("DEntity", "session"));
  mixin(OProperty!("DEntity", "site"));
  mixin(OProperty!("DEntity", "account"));
  mixin(OProperty!("DEntity", "user"));
  mixin(OProperty!("DEntity", "password"));
  mixin(OProperty!("DEntity", "entity")); */