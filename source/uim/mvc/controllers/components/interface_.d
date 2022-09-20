module uim.mvc.controllers.components.interface_;

@safe:
import uim.mvc;

interface IMVCControllerComponent : IMVCBase {
  DMVCController controller();
  O controller(this O)(DMVCController newController);
}