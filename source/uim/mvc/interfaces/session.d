module uim.mvc.interfaces.session;

import uim.mvc;
@safe:

interface ISession {
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
}