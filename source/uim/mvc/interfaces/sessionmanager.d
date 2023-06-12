module uim.mvc.interfaces.sessionmanager;

import uim.mvc;
@safe:

interface ISessionManager {
  void addSession(DInternalSession aSession) {
		_sessions[aSession.httpSessionId] = aSession;
	}
	ISession session(string httpSessionId) {
		return _sessions.get(httpSessionId, null);
	}
}