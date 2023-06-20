module uim.mvc.interfaces.sessionmanager;

import uim.mvc;
@safe:

interface ISessionManager {
  void addSession(DSession aSession); 
	DSession session(string httpSessionId, string[string] options = null); 
	DSession session(string[string] options); 
  bool isNull();

  bool update(DSession aSession);
}