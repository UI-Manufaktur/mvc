module uim.mvc.interfaces.sessionmanager;

import uim.mvc;
@safe:

interface ISessionManager {
  DSessionContainer sessionContainer();
  void sessionContainer(DSessionContainer aSessionContainer);   

  void sessions(ISession[string] someSessions);
  void sessions(ISession[] someSessions);
  ISession[] sessions();
  string[] sessionIds();

  ISession session(string[string] options);
  ISession session(string httpSessionId);

  void session(ISession aSession);
  void session(string httpSessionId, ISession aSession);

  bool hasSession(ISession aSession);
  bool hasSession(string httpSessionId);

  void addSession(ISession aSession);
  void addSession(string httpSessionId, ISession aSession);

  // Update existing session
  void updateSession(ISession aSession);
  void updateSession(string httpSessionId, ISession aSession);

  // Remove existing session
  void removeSession(ISession aSession);
  void removeSession(string httpSessionId);
}