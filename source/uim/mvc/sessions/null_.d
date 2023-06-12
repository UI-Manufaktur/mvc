/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.sessions.null_;

import uim.mvc;
@safe:

class DNullSession : DInternalSession {
  mixin(EntityThis!("NullSession"));

  this(Session httpSession) {
    super(httpSession); }

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .isNull(true);

  }

  override bool isValid(string[] factors, STRINGAA requestParameters) {
    debug writeln(moduleName!DInternalSession~":DNullSession::beforeResponse -> No internalSession => redirect /login");
    requestParameters["redirect"] = "/login";
    return false;
  }
  
  alias opIndexAssign = DElement.opIndexAssign;
  alias opIndexAssign = DEntity.opIndexAssign;
  alias opIndexAssign = DInternalSession.opIndexAssign;

  override string debugInfo() { return "Null internalSession"; }
}
mixin(EntityCalls!("NullSession"));
auto NullSession(Session httpSession) { return new DNullSession(httpSession); }

