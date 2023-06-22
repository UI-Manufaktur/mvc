module uim.mvc.interfaces.sessionmanager;

import uim.mvc;
@safe:

interface ISessionManager {
  ISession session(string[string] options); 
  ISession session(string httpSessionId); 

  void existsSession(string httpSessionId); 

  void addSession(ISession aSession); 
  void addSession(string httpSessionId, ISession aSession);

  void updateSession(string httpSessionId, ISession aSession); 
  void updateSession(ISession aSession); 

  void removeSession(string httpSessionId); 
}