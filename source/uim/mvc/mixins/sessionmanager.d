  /*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module  uim.mvc.mixins.sessionmanager;

import uim.mvc;
@safe:

template SessionManagerTemplate() {
  protected DSessionContainer _sessions;

  ISession session(string aName = null) {
    if (aName) return _sessions[aName, NullSession];
    return _sessions[_defaultSession];
  }

  void addSession(ISession aSession) {
    addSession(aSession.name, aSession);
  }
  void addSession(string aName, ISession aSession) {
    _sessions.add(aName, aSession);
  }

  void updateSession(string aName, ISession aSession) {
    _sessions.update(aName, aSession);
  }

  void removeSession(string aName) {
    _sessions.remove(aName);
  }
}