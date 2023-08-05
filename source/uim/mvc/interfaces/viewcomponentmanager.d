module uim.mvc.interfaces.viewcomponentmanager;

import uim.mvc;
@safe:

interface IViewComponentManager {
  IEntityBase entityBase();

  IViewComponent[] viewComponents();

  void addViewComponents(IViewComponent[] someComponents...);
  void addViewComponents(IViewComponent[] someComponents);
  void addViewComponent(IViewComponent aComponent);
}