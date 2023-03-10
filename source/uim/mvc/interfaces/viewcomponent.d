module uim.mvc.interfaces.viewcomponent;

@safe:
import uim.mvc;

interface IViewComponent {
  IView view();

  string render(STRINGAA options = null);
}