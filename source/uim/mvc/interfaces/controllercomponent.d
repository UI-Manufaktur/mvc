module uim.mvc.interfaces.controllercomponent;

import uim.mvc;
@safe:

interface IControllerComponent : IMVCObject {
  IController controller();
  O controller(this O)(IController newController);
}