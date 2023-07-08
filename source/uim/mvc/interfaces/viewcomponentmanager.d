module uim.mvc.interfaces.viewcomponentmanager;

import uim.mvc;
@safe:

interface IViewComponentManager {
  IEntityBase entityBase();

  IViewComponent[] components();
  void components(IViewComponent[] someComponents...);
  void components(IViewComponent[] someComponents);

  void addComponents(IViewComponent[] someComponents...);
  void addComponents(IViewComponent[] someComponents);
  void addComponent(IViewComponent aComponent);
}