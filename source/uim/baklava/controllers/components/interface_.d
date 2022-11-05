module uim.baklava.controllers.components.interface_;

@safe:
import uim.baklava;

interface IBLVControllerComponent : IBLVBase {
  IBLVController controller();
  O controller(this O)(IBLVController newController);
}