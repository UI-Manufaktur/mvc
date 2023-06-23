module uim.mvc.interfaces.sessionmanager;

import uim.mvc;
@safe:

interface ISessionManager {
  void sessions(DSessionContainer aContainer);
  DSessionContainer sessions();

  ISession session(string[string] options);
  ISession session(string httpSessionId);

  bool existsSession(ISession aSession);
  bool existsSession(string httpSessionId);

  void addSession(ISession aSession);
  void addSession(string httpSessionId, ISession aSession);

  // Update existing session
  void updateSession(ISession aSession);
  void updateSession(string httpSessionId, ISession aSession);

  // Remove existing session
  void removeSession(ISession aSession);
  void removeSession(string httpSessionId);
}