module uim.mvc.interfaces.viewcomponent;

@safe:
import uim.mvc;

interface IViewComponent {
  IView view();
  DH5Obj[] toH5(STRINGAA options = null);
  string render(STRINGAA options = null);
}