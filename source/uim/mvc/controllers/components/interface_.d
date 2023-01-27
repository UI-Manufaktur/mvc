module uim.baklava.controllers.components.interface_;

@safe:
import uim.baklava;

interface IBKLControllerComponent : IBKLBase {
  IBKLController controller();
  O controller(this O)(IBKLController newController);
}