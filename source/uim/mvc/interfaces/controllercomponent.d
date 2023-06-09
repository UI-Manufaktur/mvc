module uim.mvc.interfaces.controllercomponent;

import uim.mvc;
@safe:

interface IControllerComponent : IMVCObject {
  IControllerComponentManager manager();
  O controller(this O)(IController newController);
}