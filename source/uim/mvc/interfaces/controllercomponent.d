module uim.mvc.interfaces.controllercomponent;

@safe:
import uim.mvc;

interface IControllerComponent : IMVCObject {
  IController controller();
  O controller(this O)(IController newController);
}