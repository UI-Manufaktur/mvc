/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module  uim.mvc.mixins.sessionmanager;

import uim.mvc;
@safe:

mixin template SessionManagerTemplate() {
  protected DSessionContainer _sessions;

  ISession session(string[string] options) {
    return sessions(options.get("httpSessionId", null));
  }  
  ISession session(string httpSessionId) {
    return _sessions[httpSessionId, NullSession];
  }

  bool existsSession(string httpSessionId) {
    return (httpSessionId in _sessions ? true : false);
  }

  void addSession(ISession aSession) {
    if (aSession) addSession(aSession.name, aSession);
  }
  void addSession(string httpSessionId, ISession aSession) {
    if (aSession) _sessions.add(httpSessionId, aSession);
  }

  void updateSession(string httpSessionId, ISession aSession) {
    if (aSession && httpSessionId in _session) _sessions.update(httpSessionId, aSession);
  }
  void updateSession(ISession aSession) {
    if (aSession && aSession.httpSessionId in _session) _sessions.update(httpSessionId, aSession);
  }

  void removeSession(string httpSessionId) {
    if (existsSession(httpSessionId)) _sessions.remove(httpSessionId);
  }
}