module uim.mvc.interfaces.sessionmanager;

import uim.mvc;
@safe:

interface ISessionManager {
  DSessionContainer sessionContainer();
  void sessionContainer(DSessionContainer aSessionContainer);   

  ISession[] sessions();
  string[] sessionIds();

  ISession session(STRINGAA options);
  ISession session(string httpSessionId);

  bool hasSession(ISession aSession);
  bool hasSession(string httpSessionId);

  void addSessions(ISession[string] someSessions);
  void addSessions(ISession[] someSessions...);
  void addSessions(ISession[] someSessions);

  void addSession(ISession aSession);
  void addSession(string httpSessionId, ISession aSession);

  // Update existing session
  bool updateSession(ISession aSession);
  bool updateSession(string httpSessionId, ISession aSession);

  // Remove existing session
  bool removeSession(ISession aSession);
  bool removeSession(string httpSessionId);
}