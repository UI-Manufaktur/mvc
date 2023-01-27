module uim.mvc.views.interface_;

@safe:
import uim.mvc;

interface IMVCView : IMVCBase {
  IMVCController controller();
  O controller(this O)(IMVCController newController);

  DH5Obj[] toH5(STRINGAA options = null);
  string render(STRINGAA options = null);
}