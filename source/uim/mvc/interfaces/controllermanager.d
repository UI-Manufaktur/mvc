module uim.mvc.interfaces.controllermanager;

import uim.mvc;
@safe:

interface IControllerManager {
  DETBBase database();
  ISessionManager sessionManager();
}
