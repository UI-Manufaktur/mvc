module uim.mvc.interfaces.session;

import uim.mvc;
@safe:

interface ISession {
  ISessionManager manager();
  void manager(ISessionManager aManager);
  
  string httpSessionId();

  // IPageController page();
  DEntity login();
  DEntity session();
  DEntity site();
  DEntity account();
  DEntity user();
  DEntity password();
  DEntity entity();
  bool isNull();

  string httpSessionId();
  string accountName();
  string host();
  string loginId();

  string debugInfo();
}