module uim.mvc.sessions;

@safe:
import uim.mvc;

public import uim.mvc.sessions.reader;
public import uim.mvc.sessions.manager;
public import uim.mvc.sessions.nullsession;
public import uim.mvc.sessions.session;

DAPPSession getAppSession(STRINGAA options = null) {
  string appSessionId = options.get("appSessionId", "");
  if (appSessionId in appSessions) return appSessions[appSessionId]; 
  else return null;
}

void setAppSession(DAPPSession appSession, STRINGAA parameters) {
  if (appSession) appSessions[parameters.get("appSessionId", "")] = appSession; 
}