module uim.mvc.views.interface_;

@safe:
import uim.mvc;

interface IMVCView : IMVCBase {
  DMVCController controller();
  O controller(this O)(DMVCController newController);
}