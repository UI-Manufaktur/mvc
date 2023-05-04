/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.sessions;

import uim.mvc;
@safe:

public {
	import  uim.mvc.sessions.reader;
	import  uim.mvc.sessions.manager;
	import  uim.mvc.sessions.nullsession;
	import  uim.mvc.sessions.session;
}

DMVCSession getAppSession(STRINGAA options = null) {
  return appSessions
    .get(
        options
          .get("appSessionId", ""), null); 
}

void setAppSession(DMVCSession appSession, STRINGAA parameters) {
  if (!appSession) { return; }
  if (auto id = parameters.get("appSessionId", "")) {
    appSessions[id] = appSession; 
  }
}