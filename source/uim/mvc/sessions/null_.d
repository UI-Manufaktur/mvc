/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.sessions.null_;

import uim.mvc;
@safe:

class DNullSession : DMVCSession{
  this() { super(); }

  this(Session httpSession) {
    super(httpSession); }

  this(Session httpSession, IPageController page) {
    super(httpSession, page); }

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .isNull(true);

  }

  override bool isValid(string[] factors, STRINGAA requestParameters) {
    debug writeln(moduleName!DMVCSession~":DNullSession::beforeResponse -> No internalSession => redirect /login");
    requestParameters["redirect"] = "/login";
    return false;
  }
  override string debugInfo() { return "Null internalSession"; }
}
auto NullSession() { return new DNullSession(); }
auto NullSession(Session httpSession) { return new DNullSession(httpSession); }
auto NullSession(Session httpSession, IPageController page) { return new DNullSession(httpSession, page); }

