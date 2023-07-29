/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.sessionmanager;

import uim.mvc;
@safe:

// #region SessionManager This
  string sessionManagerThis() {
    return "
  this() {}
    ";
  }

  template SessionManagerThis() {
    const char[] SessionManagerThis = sessionManagerThis();
  }
// #endregion SessionManager This

// #region SessionManager Calls
  string sessionManagerCalls() {
    return "
  auto SessionManager() { return new DSessionManager(); }
    ";
  }

  template SessionManagerCalls() {
    const char[] SessionManagerCalls = sessionManagerCalls();
  }
// #endregion SessionManager Calls

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

  bool hasSession(ISession aSession) {
    return hasSession(aSession.httpSessionId);
  }
  bool hasSession(string httpSessionId) {
    return (sessionContainer ? (sessionContainer[httpSessionId] ? true : false) : false);
  }

    void addSessions(ISession[string] someSessions) {
      foreach(myName, mySession; someSessions) {
        addSession(myName, mySession);
      }
    }

    void addSessions(ISession[] someSessions...) {
      addSessions(someSessions.dup);
    }

    void addSessions(ISession[] someSessions) {
      someSessions.each!(mySession => addSession(mySession));
    }

  void addSession(ISession aSession) {
    if (aSession) addSession(aSession.httpSessionId, aSession);
  }
  void addSession(string httpSessionId, ISession aSession) {
    if (aSession) aSession.manager(this);
    if (sessionContainer) {
      sessionContainer.add(httpSessionId, aSession);
    }
  }
  // Update existing session
  bool updateSession(ISession aSession) {
    return (aSession ? updateSession(aSession.httpSessionId, aSession) :false);
  }
  bool updateSession(string httpSessionId, ISession aSession) {
    if (sessionContainer) {
      sessionContainer.update(httpSessionId, aSession);
      return true;
    }
    return false;
  }

  // Remove existing session
  bool removeSession(ISession aSession) {
    return (aSession ? removeSession(aSession.httpSessionId) : false);
  }
  bool removeSession(string httpSessionId) {
    if (sessionContainer) {
      sessionContainer.remove(httpSessionId);
      return true;
    }
    return false;
  }
}
