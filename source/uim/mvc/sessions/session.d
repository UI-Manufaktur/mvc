/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.sessions.session;

import uim.mvc;
@safe:

class DSession : DEntity, ISession {
  mixin(EntityThis!("Session", "DSession"));

  this(HttpSession httpSession) {
    this().httpSessionId(httpSession.id);
  }

  mixin(OProperty!("ISessionManager", "manager"));
  mixin(OProperty!("string", "httpSessionId"));
  mixin(OProperty!("IPageController", "page"));
  mixin(OProperty!("DEntity", "login"));
  mixin(OProperty!("DEntity", "session")); // ?? Required
  mixin(OProperty!("DEntity", "site"));
  mixin(OProperty!("DEntity", "account"));
  mixin(OProperty!("DEntity", "user"));
  mixin(OProperty!("DEntity", "password")); // ! Ugly
  mixin(OProperty!("DEntity", "entity"));
  mixin(OProperty!("bool", "isNull"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .isNull(false);
  }

  bool isValid(string[] checks, STRINGAA requestParameters = null) {
    foreach (check; checks) {
      debug writeln(moduleName!DSession~":DSession::beforeResponse - Check "~check);
      switch (check) {
        case "login": if (!login) {
          debug writeln(moduleName!DSession~":DSession::beforeResponse -> No login => redirect /login");
          requestParameters["redirect"] = "/login";
          return false; } 
          login.lastAccessedOn(toTimestamp(now)).save; break;
        case "session": if (!session) {
          debug writeln(moduleName!DSession~":DSession::beforeResponse -> No session => redirect /login");
          requestParameters["redirect"] = "/login";
          return false; } 
          session.lastAccessedOn(toTimestamp(now)).save; break;
        case "site": if (!site) {
          debug writeln(moduleName!DSession~":DSession::beforeResponse -> No site => redirect /");
          requestParameters["redirect"] = "/";
          return false; }
          site.lastAccessedOn(toTimestamp(now)).save; break;
        case "account": if (!account) {
          debug writeln(moduleName!DSession~":DSession::beforeResponse -> No account => redirect /login");
          requestParameters["redirect"] = "/login";
          return false; } break;
        case "password": if (!password) {
          debug writeln(moduleName!DSession~":DSession::beforeResponse -> No password => redirect /login");
          requestParameters["redirect"] = "/login";
          return false; } 
          password.lastAccessedOn(toTimestamp(now)).save; break;
        case "user": if (!user) {
          debug writeln(moduleName!DSession~":DSession::beforeResponse -> No user => redirect /login");
          requestParameters["redirect"] = "/login";
          return false; } 
          user.lastAccessedOn(toTimestamp(now)).save; break;
        case "entitybase": if (!page && page.entityBase) {
          debug writeln(moduleName!DSession~":DSession::beforeResponse -> No site => redirect /error");
          requestParameters["redirect"] = "/error?message=entityBase";
          return false; } break;
        default: break;
      }      
    }
    return true;
  }

  override string opIndex(string key) {
    switch(key) {
      case "id": return this.id.toString;
      case "lastAccessedOn": return to!string(this.lastAccessedOn); 
      default: return null; 
    }
  } 

  alias opIndexAssign = DElement.opIndexAssign;
  alias opIndexAssign = DEntity.opIndexAssign;
  
  override void opIndexAssign(string key, string value) {
    super.opIndexAssign(key, value);

    switch(key) {
      case "id": this.id = value; break;
      case "lastAccessedOn": this.lastAccessedOn = to!long(value); break;
      default: break;
    }
  } 

  void opIndexAssign(string key, long value) {
    // super.opIndexAssign(key, value);

    switch(key) {
      case "lastAccessedOn": this.lastAccessedOn = value; break;
      default: break;
    }
  } 

  void opIndexAssign(string key, DEntity value) {
    // super.opIndexAssign(key, value);
    
    switch(key) {
      case "login": this.login = value; break;
      case "session": this.session = value; break;
      case "site": this.site = value; break;
      case "account": this.account = value; break;
      case "user": this.user = value; break;
      case "password": this.password = value; break;
      case "entity": this.entity = value; break;
      default: break;
    }
  } 

  alias save = DEntity.save;
  void save() {
    // this["lastAccessISO"] = lastAccessedOn.toISOString;
    if (site) this["siteId"] = site.id;

    if (manager) {
      manager.updateSession(this);
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
mixin(EntityCalls!("APPSession", "DSession"));
auto APPSession(HttpSession httpSession) { return new DSession(httpSession); }

