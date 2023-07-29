module uim.mvc.interfaces.view;

import uim.mvc;
@safe:

interface IView : IMVCObject {
  IViewManager manager();
  void manager(IViewManager aManager);

  bool isNull();

  IViewComponent[] components();
  void components(IViewComponent[] someComponents);
  void addComponent(IViewComponent aComponent);

  DH5Obj[] toH5(STRINGAA options = null);
  string render(STRINGAA options = null);
}