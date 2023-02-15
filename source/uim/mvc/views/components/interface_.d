module uim.mvc.views.components.interface_;

@safe:
import uim.mvc;

interface IViewComponent : IMVCObject {
  IView view();
  O view(this O)(IView newView);

  DH5Obj[] toH5(STRINGAA options = null);
  string render(STRINGAA options = null);
}