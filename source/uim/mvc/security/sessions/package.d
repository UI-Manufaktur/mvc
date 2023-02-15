module uim.mvc.security.sessions;

public import uim.mvc.security.sessions.session;

@safe:
DSession getAppSession(string[string] options = null) {
  string appSessionId = options.get("appSessionId", "");
  return uim.mvc.appSessions.get(appSessionId, null);
}

void setAppSession(DSession appSession, string[string] parameters) {
  if (appSession) uim.mvc.appSessions[parameters.get("appSessionId", "")] = appSession; 
}