/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.sessions.manager;

import uim.mvc;
@safe:

DSession[string] sessions;

class DSessionManager : ISessionManager {
	this() {}

  mixin(OProperty!("bool", "isNull"));

	// #region Sessions
		protected DSession[string] _sessions;

		void addSession(DSession aSession) {
			aSesssion.manager(this);
			_sessions[aSession.httpSessionId] = aSession;
		}

		DSession session(string httpSessionId, string[string] options = null) {
			return _sessions.get(httpSessionId, null);
		}
		DSession session(string[string] options) {
			return _sessions.get(
				options.get(["httpSessionId"], null), 
			null);
		}
	// #endregion Sessions

	void initialize(Json configSettings = Json(null)) {

    this
      .isNull(true);
  }

	bool update(DSession aSession) {
		return false;
	}
}
auto SessionManager() { return new DSessionManager(); }
