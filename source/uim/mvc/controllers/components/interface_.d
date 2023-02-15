module uim.mvc.controllers.components.interface_;

@safe:
import uim.mvc;

interface IControllerComponent : IMVCObject {
  IController controller();
  O controller(this O)(IController newController);
}