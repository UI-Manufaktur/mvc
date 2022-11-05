module uim.baklava.controllers.components.interface_;

@safe:
import uim.baklava;

interface IMVCControllerComponent : IMVCBase {
  IMVCController controller();
  O controller(this O)(IMVCController newController);
}