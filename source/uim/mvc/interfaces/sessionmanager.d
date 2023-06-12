module uim.mvc.interfaces.sessionmanager;

import uim.mvc;
@safe:

interface ISessionManager {
  void addSession(ISession aSession); 
	ISession session(string httpSessionId); 
}