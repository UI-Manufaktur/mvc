module uim.mvc.interfaces.view;

@safe:
import uim.mvc;

interface IView : IMVCObject {
  IController controller();

  DH5Obj[] toH5(STRINGAA options = null);
  string render(STRINGAA options = null);
}