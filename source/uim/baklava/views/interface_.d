module uim.baklava.views.interface_;

@safe:
import uim.baklava;

interface IMVCView : IMVCBase {
  IMVCController controller();
  O controller(this O)(IMVCController newController);

  DH5Obj[] toH5(STRINGAA options = null);
  string render(STRINGAA options = null);
}