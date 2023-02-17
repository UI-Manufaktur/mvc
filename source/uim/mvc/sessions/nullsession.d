module uim.mvc.sessions.nullsession;

@safe:
import uim.mvc;

class DAPPNullSession : DMVCSession{
  this() { super(); }

  this(Session httpSession) {
    super(httpSession); }

  this(Session httpSession, DPageController page) {
    super(httpSession, page); }

  override bool isValid(string[] factors, STRINGAA reqParameters) {
    debug writeln(moduleName!DMVCSession~":DAPPNullSession::beforeResponse -> No appSession => redirect /login");
    reqParameters["redirect"] = "/login";
    return false;
  }
  override string debugInfo() { return "Null appSession"; }
}
auto APPNullSession() { return new DAPPNullSession(); }
auto APPNullSession(Session httpSession) { return new DAPPNullSession(httpSession); }
auto APPNullSession(Session httpSession, DPageController page) { return new DAPPNullSession(httpSession, page); }

