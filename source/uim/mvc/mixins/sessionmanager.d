/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.sessionmanager;

import uim.mvc;
@safe:

mixin template SessionContainerTemplate() {
  // #region sessionContainer
  protected DSessionContainer _sessionContainer;  
  DSessionContainer sessionContainer() {
    if (_sessionContainer) return _sessionContainer;
    return (_manager ? manager.sessionContainer : null); 
  }  
  void sessionContainer(DSessionContainer aSessionContainer) {    
    _sessionContainer = aSessionContainer;
  }  
  // #endregion sessionContainer
}

mixin template SessionManagerTemplate() {
  // #region sessions
    void sessions(ISession[string] someSessions) {
      foreach(myName, mySession; someSessions) {
        session(myName, mySession);
      }
    }

    void sessions(ISession[] someSessions) {
      foreach(mySession; someSessions) {
        session(mySession);
      }
    }

    ISession[] sessions() { 
      return (sessionContainer ? sessionContainer.values : null); 
    }
    string[] sessionIds() {
      return (sessionContainer ? sessionContainer.keys : null);
    }
  // #endregion sessions

  ISession session(string[string] options) {
    return session(options.get("httpSessionId", null));
  }  
  ISession session(string httpSessionId) {
    return (sessionContainer ? sessionContainer[httpSessionId] : null);
  }
  void session(ISession aSession) {
    if (aSession) session(aSession.httpSessionId, aSession);
  }
  void session(string httpSessionId, ISession aSession) {
    if (sessionContainer) sessionContainer[httpSessionId] = aSession;
  }

  bool hasSession(ISession aSession) {
    return hasSession(aSession.httpSessionId);
  }
  bool hasSession(string httpSessionId) {
    return (sessionContainer ? (sessionContainer[httpSessionId] ? true : false) : false);
  }

  void addSession(ISession aSession) {
    if (aSession) addSession(aSession.httpSessionId, aSession);
  }
  void addSession(string httpSessionId, ISession aSession) {
    if (sessionContainer && aSession) sessionContainer.add(httpSessionId, aSession);
  }
  // Update existing session
  void updateSession(ISession aSession) {
    if (aSession) updateSession(aSession.httpSessionId, aSession);
  }
  void updateSession(string httpSessionId, ISession aSession) {
    if (sessionContainer && hasSession(httpSessionId)) sessionContainer.update(httpSessionId, aSession);
  }

  // Remove existing session
  void removeSession(ISession aSession) {
    if (aSession) removeSession(aSession.httpSessionId);
  }
  void removeSession(string httpSessionId) {
    if (sessionContainer && hasSession(httpSessionId)) sessionContainer.remove(httpSessionId);
  }
}
