module uim.mvc.interfaces.viewcomponent;

import uim.mvc;
@safe:

interface IViewComponent {
  IViewComponentManager manager();

  DH5Obj[] toH5(STRINGAA options = null);
  string render(STRINGAA options = null);
}