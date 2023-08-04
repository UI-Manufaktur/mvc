/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.helpers.session;

import uim.mvc;
@safe:

string httpSessionId(HTTPServerRequest aRequest, STRINGAA someOptions = null) {
  if (aRequest && aRequest.session) {
    return aRequest.session.id;
  }
  return someOptions.get("httpSessionId", null);
}

ISession getSession(ISessionManager aManager, HTTPServerRequest aRequest, STRINGAA someOptions = null) {
  return (aManager ? aManager.session(httpSessionId(aRequest, someOptions)) : null);
}

/* DSession sessionManager.session(STRINGAA options = null) {
  return internalSessions
    .get(
        options
          .get("internalSessionId", ""), null); 
}

void setInternalSession(DSession internalSession, STRINGAA parameters) {
  if (!internalSession) { return; }
  if (auto id = parameters.get("internalSessionId", "")) {
    internalSessions[id] = internalSession; 
  }
} */