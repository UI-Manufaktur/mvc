/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.sessions.nullsession;

import uim.mvc;
@safe:

class DAPPNullSession : DMVCSession{
  this() { super(); }

  this(Session httpSession) {
    super(httpSession); }

  this(Session httpSession, IPageController page) {
    super(httpSession, page); }

  override bool isValid(string[] factors, STRINGAA requestParameters) {
    debug writeln(moduleName!DMVCSession~":DAPPNullSession::beforeResponse -> No appSession => redirect /login");
    requestParameters["redirect"] = "/login";
    return false;
  }
  override string debugInfo() { return "Null appSession"; }
}
auto APPNullSession() { return new DAPPNullSession(); }
auto APPNullSession(Session httpSession) { return new DAPPNullSession(httpSession); }
auto APPNullSession(Session httpSession, IPageController page) { return new DAPPNullSession(httpSession, page); }

