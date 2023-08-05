module uim.mvc.interfaces.view;

import uim.mvc;
@safe:

interface IView : IMVCObject, IViewComponentManager  {
  IViewManager manager();
  void manager(IViewManager aManager);

  bool isNull();

  DH5Obj[] toH5(STRINGAA options = null);
  string render(STRINGAA options = null);
}