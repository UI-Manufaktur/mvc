module uim.mvc.interfaces.view;

import uim.mvc;
@safe:

interface IView : IMVCObject {
  IController controller();

  bool isNull();
  DH5Obj[] toH5(STRINGAA options = null);
  string render(STRINGAA options = null);
}