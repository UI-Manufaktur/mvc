module uim.mvc.interfaces.sessionmanager;

import uim.mvc;
@safe:

interface ISessionManager {
  void addSession(ISession aSession); 
	ISession session(string httpSessionId, string[string] options = null); 
	ISession session(string[string] options); 
  bool isNull();

  ISession[] sessions();

  bool update(ISession aSession);
}