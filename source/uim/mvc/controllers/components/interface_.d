module uim.mvc.controllers.components.interface_;

@safe:
import uim.mvc;

interface IMVCControllerComponent : IMVCBase {
  IMVCController controller();
  O controller(this O)(IMVCController newController);
}