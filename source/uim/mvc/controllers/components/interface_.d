module uim.mvc.controllers.components.interface_;

@safe:
import uim.mvc;

interface IControllerComponent : IMVCBase {
  IController controller();
  O controller(this O)(IController newController);
}