module uim.mvc.interfaces.controllercomponent;

import uim.mvc;
@safe:

interface IControllerComponent : IMVCObject {
  IControllerComponentManager manager();
}