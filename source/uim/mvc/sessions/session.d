module uim.mvc.sessions.session;

@safe:
import uim.mvc;

class DMVCSession {
  this() {}

  this(Session httpSession) {
    _httpSession = httpSession;
    this.id(httpSession.id); }

  this(Session httpSession, DPageController page) {
    this(httpSession);
    this.page(page); }

  mixin(OProperty!("string", "id"));
  Session _httpSession;

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
      debug writeln(moduleName!DMVCSession~":DMVCSession::beforeResponse - Check "~check);
      switch (check) {
        case "login": if (!login) {
          debug writeln(moduleName!DMVCSession~":DMVCSession::beforeResponse -> No login => redirect /login");
          reqParameters["redirect"] = "/login";
          return false; } 
          login.lastAccessedOn(toTimestamp(now)).save; break;
        case "session": if (!session) {
          debug writeln(moduleName!DMVCSession~":DMVCSession::beforeResponse -> No session => redirect /login");
          reqParameters["redirect"] = "/login";
          return false; } 
          session.lastAccessedOn(toTimestamp(now)).save; break;
        case "site": if (!site) {
          debug writeln(moduleName!DMVCSession~":DMVCSession::beforeResponse -> No site => redirect /");
          reqParameters["redirect"] = "/";
          return false; }
          site.lastAccessedOn(toTimestamp(now)).save; break;
        case "account": if (!account) {
          debug writeln(moduleName!DMVCSession~":DMVCSession::beforeResponse -> No account => redirect /login");
          reqParameters["redirect"] = "/login";
          return false; } break;
        case "password": if (!password) {
          debug writeln(moduleName!DMVCSession~":DMVCSession::beforeResponse -> No password => redirect /login");
          reqParameters["redirect"] = "/login";
          return false; } 
          password.lastAccessedOn(toTimestamp(now)).save; break;
        case "user": if (!user) {
          debug writeln(moduleName!DMVCSession~":DMVCSession::beforeResponse -> No user => redirect /login");
          reqParameters["redirect"] = "/login";
          return false; } 
          user.lastAccessedOn(toTimestamp(now)).save; break;
        case "database": if (!page && page.database) {
          debug writeln(moduleName!DMVCSession~":DMVCSession::beforeResponse -> No site => redirect /error");
          reqParameters["redirect"] = "/error?message=database";
          return false; } break;
        default: break;
      }      
    }
    return true;
  }

  string opIndex(string key) {
    switch(key) {
      case "id": return this.id;
      case "lastAccessedOn": return to!string(this.lastAccessedOn); 
      default: return null; 
    }
  } 

  void opIndexAssign(string key, string value) {
    switch(key) {
      case "id": this.id = value; break;
      case "lastAccessedOn": this.lastAccessedOn = to!long(value); break;
    }
  } 

  void opIndexAssign(string key, long value) {
    switch(key) {
      case "lastAccessedOn": this.lastAccessedOn = value; break;
    }
  } 

  void opIndexAssign(string key, DEntity value) {
    switch(key) {
      case "login": this.login = value; break;
      case "session": this.session = value; break;
      case "site": this.site = value; break;
      case "account": this.account = value; break;
      case "user": this.user = value; break;
      case "password": this.password = value; break;
      case "entity": this.entity = value; break;
    }
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
auto MVCSession(Session httpSession) { return new DMVCSession(httpSession); }
auto MVCSession(Session httpSession, DPageController page) { return new DMVCSession(httpSession, page); }

/*   mixin(OProperty!("DPageController", "page"));
  mixin(OProperty!("long", "lastAccessedOn"));
  mixin(OProperty!("DEntity", "login"));
  mixin(OProperty!("DEntity", "session"));
  mixin(OProperty!("DEntity", "site"));
  mixin(OProperty!("DEntity", "account"));
  mixin(OProperty!("DEntity", "user"));
  mixin(OProperty!("DEntity", "password"));
  mixin(OProperty!("DEntity", "entity")); */