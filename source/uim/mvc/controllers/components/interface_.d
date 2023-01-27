module uim.mvc.controllers.components.interface_;

@safe:
import uim.mvc;

interface IBKLControllerComponent : IBKLBase {
  IBKLController controller();
  O controller(this O)(IBKLController newController);
}